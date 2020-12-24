# json_schemac
`json_schemac` is a JSON schema generator that gets JSON schema string from an original domain specific language.

## Example
This is the first example.  This means simple object.
```
<object> { }
```

You can compile it as the following:
```
$ echo '<object> { }' | bin/json_schemac
{
  "type": "object"
}
```

You can add some properties to a schema with letter `+` or `-`.
`+` means a required property and `-` means not required one.

```
<object> {
  + name <string>
  + price <number>
}
```

JSON schema you can get is the following:
```
{
  "type": "object",
  "properties": {
    "name": {
      "type": "string"
    },
    "price": {
      "type": "number"
    }
  },
  "required": [
    "name",
    "price"
  ]
}
```

See samples for detail.
