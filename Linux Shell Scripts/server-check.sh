#!/bin/bash
if curl -s --head http://osric.com/ | grep "200 OK" > /dev/null
  then 
    echo "The HTTP server on osric.com is up!" > /dev/null
  else
    echo "The HTTP server on osric.com is down!"
fi