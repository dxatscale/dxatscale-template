# Trigger bypass strategy

This package implements a simple bypass strategy based on a user hierarchical
setting to define whether or not a specific trigger handler should be bypassed.

## Design

There is no one size fits all bypass strategy. Different handlers can be
bypassed for different reasons. Each handler has the knowledge of whether it
should be by passed or not, hence the reason why each handler should implement
the `Disableable` interface.

Because we don't want a proliferation of the same bypass logic in each and
every trigger handler, they delegate this logic to a strategy.

## Implementation

Each bypass strategy must implement the `Disableable` interface and return `true`
if the handler should be bypassed.

Each trigger handler should invoke the bypass strategy in the `isDisabled` method

```java
    public Boolean isDisabled() {
        return (new TriggerBypassStrategy()).isDisabled();
    }
```
