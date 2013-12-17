accounts Cookbook
=================

Requirements
------------

- generates **my-accounts** recipe
- it adds `include_recipe "accounts"` in **my-accounts** recipe
- add to attributes `default.rb`

Attributes
----------

- accounts

```
default["accounts"] = [
  { "username"  => "app", "uid" => 1100,
    "groupname" => "app", "gid" => 1100,
    "ssh_pub_key" => "KEY" }
]
```

Usage
----------
#### accounts::default


Contributing
------------
e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github


License and Authors
-------------------
Authors:
Yuji Takaesu (yusabana)

