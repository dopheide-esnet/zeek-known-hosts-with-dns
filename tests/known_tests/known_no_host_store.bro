# @TEST-EXEC: bro -C -r $TRACES/known_host_test.pcap ../../../scripts %INPUT
# @TEST-EXEC: cat known_hosts.log |grep fields > fields.txt
# @TEST-EXEC: bro-cut server_modes host < known_hosts.log > known_hosts.tmp && mv known_hosts.tmp known_hosts.log
# @TEST-EXEC: btest-diff known_hosts.log
# @TEST-EXEC: btest-diff fields.txt

# Unfortunately, we can't really test that the DNS name matches because it could fail the race condition.
# But we can test that a host was detected and that the fields in the log are correct.

redef Site::local_nets += { [2001:400:0::]/32, 198.128.0.0/16 };
redef Known::use_host_store = F;
