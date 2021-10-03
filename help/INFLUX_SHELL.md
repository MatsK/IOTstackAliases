#### Alias: INFLUX_SHELL / <a name="aliasInflux"> `influx` { argument …} </a>

It expands to:

```bash
docker exec -it influxdb influx -precision=rfc3339
```

It has the same effect as:

```
docker exec -it influxdb bash
influx -precision=rfc3339
```

Or, in words:

1. Open a shell into the influxdb container, then
2. From inside the influxdb container, execute the `influx` command.

The `influx` command is InfluxDB's Command Line Interface.

The `-precision=rfc3339` option tells `influx` to display timestamps in human-readable form rather than nanoseconds since 1/1/1970. The timestamps are in UTC but you can tell `influx` to convert them to your local time by adding a `tz()` function to queries, like this:

```sql
SELECT * from «measurement» WHERE «criteria» tz('Australia/Sydney') 
```

You can append any other arguments supported by the `influx` CLI to the `influx` alias and the fact that `docker exec` is involved becomes entirely transparent. For example, all of these are valid:

```bash
influx
influx -database=«database name»
influx -type=flux
influx -database=«database name» -type=flux
```

## [Back to Alias help ...](ALIAS_HELP.md)

## [Back to README.md](/README.md)

