# Card::Connect::Debug

This gem give the ability to Debug card connect.  It does the following

1. It outputs the request, and response bodies
2. It will generate errors based on specific amounts

ex)
    If you send up $5.21 or $7.50 it will trigger an ConnectionFailed error
    If you send up $5.22 or $7.83 it will trigger an TimeoutError error
    Use this in conjuction with the API simulator to trigger declines etc.