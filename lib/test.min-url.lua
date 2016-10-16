local test = require 'min-test'
local Url = require 'min-url'
local _ = require 'shim'

test('Url.parse', function(t)
	local url = Url.parse('http://user:pass@host.com:8080/p/a/t/h?query=string#hash')
	-- print(_.dump(url))
	t.deepEqual(url, {
		protocol = 'http:',
		auth = 'user:pass',
		hostname = 'host.com',
		port = 8080,
		pathname = '/p/a/t/h',
		query = 'query=string',
		hash = '#hash'
	})

	local url2 = Url.parse('https://www.google.com/#q=search')
	-- print(_.dump(url2))
	t.deepEqual(url2, {
		protocol = 'https:',
		auth = nil,
		hostname = 'www.google.com',
		port = nil,
		pathname = '/',
		query = '',
		hash = '#q=search'
	})

	local url3 = Url.parse('qiyimobile://lf/res.madeindexpage?id=com.iqiyi.ishow&action=PLUGIN_ISHOW_HOMEPAGE')
	print(_.dump(url3))
end)

test('Url.format', function(t)
	local url = Url.parse('http://user:pass@host.com:8080/p/a/t/h?query=string#hash')
	-- TODO
	-- t.equal(url, Url.format(Url.parse(url)))
end)
