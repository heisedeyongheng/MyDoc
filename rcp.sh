#!/usr/bin/expect
if {$argc < 2} {
    send_user "usage: $argv0 src_file username ip dest_file password\n"
    exit
}
set src_file [lindex $argv 0]
set username [lindex $argv 1]
set host_ip [lindex $argv 2]
set dest_file [lindex $argv 3]
set password [lindex $argv 4]

spawn scp -P 21232 $username@$host_ip:$src_file $dest_file
expect {
        "(yes/no)?"
        {
                send "yes\n"
                expect "*assword:" {send "$password\n"}
        }
        "*assword:"
        {
                send "$password\n"
                set timeout 1000
        }
}
expect "100%"
expect eof