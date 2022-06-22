#!/bin/bash
receiver=”admin@example.com”
sub=”Greeting”
message=”Welcome to our site”
`mail -s $sub $receiver <<< $message`