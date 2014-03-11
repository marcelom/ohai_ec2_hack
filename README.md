# Ohai EC2 Hack

This cookbook crates a hack around the Ohai EC2 VPC bug.

## What Is This Bug ?

This bug is caused by the way Amazon assigns MAC addresses to instances when inside a VPC.

Ohai uses this information in order to avoid timing out in the metadata interface, and thus slowing its execution for non-EC2 nodes.

It is well documented on [OHAI-310](https://tickets.opscode.com/browse/OHAI-310).

## Usage

This is a very simple cookbook, and there is nothing really to do here. Just make sure it runs really early on your run list, or at least before you use any Ohai EC2 attributes.

Just make sure you dont run it on a non-EC2 instance, otherwise the execution of Ohai plugins will be significantly slowed down.

If you want to keep it in place with non-EC2 machines, make sure to set the attribute `[:ohai_ec2_hack][:enabled]` to `false`. It defaults to `true`, which means that the hack will be applied.

