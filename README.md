# Email Container
Container which runs an email stack.

# Table Of Contents
- [Overview](#overview)
- [Development](#development)
- [Run](#run)

# Overview
Currently runs a send only email setup with Postfix and OpenDKIM.

# Development
Build the image:

```
make
```

# Run
Before running the container requires the appropriate files be in place on 
the host operating system:

- `/etc/opendkim/keys`: Directory which holds OpenDKIM signing keys

Alternate locations for these files can be configured via options provided to 
the run script. See the script's help text for more information.

Run by executing:

```
./run.sh
```
