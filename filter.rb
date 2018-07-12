#!/usr/bin/env ruby

def print_alfred_template elements
print <<-HEREDOC
<?xml version="1.0"?>
<items>
HEREDOC
elements.each do |e|
	print <<-HEREDOC
    <item valid="YES">
        <title>#{e[:title]}</title>
        <subtitle>#{e[:subtitle]}</subtitle>
        <icon>#{e[:icon]}</icon>
        <arg>#{e[:arg]}</arg>
    </item>
    HEREDOC
end
print <<-HEREDOC
</items>
HEREDOC
end

processes = []
if `/usr/local/bin/supervisorctl -u superv -p 12345678 status`.start_with?('http://localhost:9001 refused connection')
	processes << {
		:title => 'Start Supervisord',
		:subtitle => 'Start Monitoring process',
		:arg => './scripts/superv.sh',
		:icon => 'stopped.png'
	}
	print_alfred_template processes
	exit
end

`/usr/local/bin/supervisorctl -u superv -p 12345678 status`.lines.each do |process|
	args = process.split(' ')
	name = args[0]
	status = args[1]
	cmd = status == 'RUNNING' || status == 'STARTING' ? 'stop' : 'start'
	icon = status == 'RUNNING' ? 'started.png' : 'stopped.png'
	command = '/usr/local/bin/supervisorctl -u superv -p 12345678 ' + cmd + ' ' + name

	processes << {
		:title => name.split('-').join(' ').capitalize,
		:subtitle => status.capitalize,
		:arg => command,
		:icon => icon
	}
end
print_alfred_template processes



