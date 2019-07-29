# zeek-known-hosts-with-dns

Usage:
You will need to @unload (or comment out) the base protocols/conn/known-hosts
policy.  It's recommended to keep "const host_tracking = LOCAL_HOSTS" so
Zeek doesn't try to keep DNS information for all external hosts as well.

Description:
This script expands the base known-hosts policy to include reverse DNS queries
and syncs it across all workers.  Since this is not just a known_hosts log
file, it's important to recognize this will increase memory usage relative to
the amount of hosts that are being tracked.

The initial motivation for this policy was to remove the need for the majority
of the asynchronous DNS calls by protocols/ssh/interesting-hostnames.zeek.
However, since there may be other cases where the known DNS data is useful,
it was decided to offer them as two separate packages.

In our environment, with lots of automated processes ssh'ing into systems,
the combination of these two policies reduces the asynch DNS calls by 99%.

Testing:
After loading the policy, you can check the current list of known hosts using:

broctl print Known::hosts
or
zeekctl print Known::hosts

