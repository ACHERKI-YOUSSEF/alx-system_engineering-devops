Issue Summary
Duration: 2024-08-15, 14:00 UTC to 17:30 UTC (3 hours, 30 minutes)
Impact: Imagine trying to buy your favorite gadget online, but instead of a smooth checkout, you’re stuck in an endless loading loop. That’s what 75% of our users experienced during this outage. The checkout process was so slow that many users gave up, leading to a 20% drop in completed transactions. Yikes!
Root Cause: The culprit? A sneaky memory leak in our Redis caching layer that slowly ate up all available resources until everything came to a grinding halt.

Timeline
14:00 UTC: The on-call engineer’s Spidey-sense (or rather, our monitoring system) tingled with alerts about increased latency.
14:10 UTC: Suspecting an attack by internet gremlins (DDoS), the engineer started checking server loads.
14:25 UTC: Servers looked fine on the surface—CPU was chill, but memory was having a meltdown.
14:30 UTC: Red herring: Focus shifted to recent code deployments, thinking we might’ve pushed some bad code.
15:00 UTC: “This is bigger than we thought!” The incident was escalated to the SRE Avengers.
15:30 UTC: The SRE team discovered Redis was the memory hogging villain.
16:00 UTC: A quick reboot of Redis gave temporary relief, but the problem started creeping back.
16:30 UTC: Finally, the culprit was identified—an update to Redis that turned it into a memory muncher.
17:00 UTC: Rolled back the Redis update faster than hitting “Undo” on a mistaken email.
17:30 UTC: Crisis averted. Monitoring showed that the system was back to normal, with no more memory spikes.

Root Cause and Resolution
Root Cause:
The heart of the problem was a memory leak in Redis, introduced by a recent update. Picture it like a leaky faucet—drip, drip, drip—until suddenly, your house (or in this case, our servers) is flooded. The leak caused memory to slowly fill up until there was no room left to operate, leading to slow response times and ultimately making our service about as responsive as a brick.
Resolution:
The fix was as simple as a “Control + Z” move. We rolled back to a previous version of Redis that wasn’t prone to memory gluttony. This immediately stopped the leak, and the system’s memory usage stabilized, making everything work smoothly again.

Corrective and Preventative Measures
Improvements:
Better Monitoring: We’ll add memory usage to our watchlist, so we catch these leaks before they flood the system.
Thorough Testing: Redis updates (and other critical infrastructure changes) will now go through a tougher bootcamp before making it to production.
Automated Rollbacks: If something smells fishy post-deployment, the system will automatically revert to the last stable version—no questions asked.
Tasks:
Patch Redis Servers: Roll back Redis across all servers to the last stable version.
Enhance Monitoring: Set up memory usage alerts so that our engineers aren’t caught off guard by leaks.
Update Deployment Procedures: Strengthen testing protocols, particularly for infrastructure updates, to catch issues before they go live.
Automate Rollbacks: Create a script that auto-reverts deployments if they cause abnormal system behavior.

Final Thoughts
We learned a valuable lesson here: even the smallest updates can cause big headaches. But with better monitoring, testing, and rollback strategies, we’re ready to tackle the next challenge—hopefully with fewer surprises and a lot more uptime.

