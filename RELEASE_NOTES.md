# Version 0.2.0

This version significantly reworks the internals and provides new
public facing features. This came out of real world experience using
the library in other projects. This release changes two things:

1. `Logger` is **NO LONGER** monkey patched by default
2. Add a formatter that does not include timestamps.

The first point was done to make this library a better citizen in the
ruby community by following this principle: global non-opt-in monkey
patching is bad and should be avoided. Monkey patching in itself is
fine, as long as the developers knows it's happening and has control
over it.

The second point is a minor enhancement but goes a long way in keeping
down the noise. Most distributed logging systems will insert their own
timestamp on all messages. This becomes annoying when your log
messages contain timestamps. This creates a bunch of noise and
pointless duplication. This functionality is available either via
monkey patch or subclass.

## Upgrading from 0.1.x

0.2.x is backward compatible with 0.1.0 depending on how the library
is required. `require 'logger/better'` will keep the 0.1.x behavior.
