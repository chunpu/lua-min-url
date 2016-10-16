min-url.lua
===

Install
---

use opm

```bash
opm install lua-url
```


Usage
---

```lua
local Url = require 'min-url'

test('Url.parse', function(t)
	local url = Url.parse('http://user:pass@host.com:8080/p/a/t/h?query=string#hash')
	t.deepEqual(url, {
		protocol = 'http:',
		auth = 'user:pass',
		hostname = 'host.com',
		port = 8080,
		pathname = '/p/a/t/h',
		query = 'query=string',
		hash = '#hash'
	})
end)
```


TODO
---

- `Url.format`
- `shouldParseQuery`
