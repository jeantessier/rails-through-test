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

## To Run

There is no UI per se.  You can  experiment through the Rails console.

```bash
bin/rails console
```

## Generating Test Data

You can create CEOs, directors, managers, and workers.

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

You can populate `hours` and `rate` like this:

```ruby
Worker.all.each do |worker|
  worker.update(hours: Random.rand * 33, rate: 33 + Random.rand * 50)
end
```

If you don't mind that all records have the same values, you can issue a single
update statement with the following:

```ruby
Worker.update_all(hours: Random.rand * 33, rate: 33 + Random.rand * 50)
```
