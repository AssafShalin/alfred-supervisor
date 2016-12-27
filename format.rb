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


elements = []

ARGF.each do |line|
    elements.push({
    		:title => line,
    		:subtitle => "Open " + line.strip + " log file",
    		:icon => "logicon.png",
    		:arg => line.strip
    	})
end

print_alfred_template elements


