# Rails Through Test

A sample app that illustrates `has_many` `through:` associations through
multiple underlying associations.

I wanted to see if `has_many:` `through:` associations could span multiple
associations.  For example:

```
+-----+
| Ceo |
+-----+
 | | |  has_many   +----------+
 | | +----------->*| Director |
 | |               +----------+
 | |                       | |  has_many   +---------+
 | |   through             | +----------->*| Manager |
 | +-----------------------|------------->*+---------+
 |                         |                       |  has_many
 |                         |   through             +----------->*+----------+
 |   through               +----------------------------------->*+  Worker  +
 +------------------------------------------------------------->*+----------+

```

I also wanted to see if I could do the same with `has_one:` `through:`
associations in the reverse direction.

With this setup, I can create CEOs, directors, managers, and workers.

```ruby
c = Ceo.create!
5.times do
  d = c.directors.create!
  5.times do
    m = d.managers.create!
    5.times do
      m.workers.create!
    end
  end
end

c.workers.pluck(:id)
# => [1, 2, ..., 125]
```

## To Run

There is no UI per se.  You can  experiment through the Rails console.

```bash
bin/rails console
```
