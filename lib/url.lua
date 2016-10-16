local _ = require 'shim'

local Url = {
	version = "1.0.1"
}

local function splitTwo(str, sp)
	local arr = _.split(str, sp, true)
	local first = arr[1]
	local second = _.join(_.slice(arr, 2), sp)
	return first, second
end

local function splicePattern(str, pattern)
	local matched
	if _.isString(str) then
		str = str:gsub(pattern, function(_matched)
			matched = _matched
			return ''
		end)
	end
	return matched, str
end

function Url.parse(str, shouldParseQuery)
	if not _.isString(str) then
		return str
	end

	local url = {}
	local rest = str

	rest, url.hash = splitTwo(rest, '#')
	if url.hash then
		url.hash = '#' .. url.hash
	end

	rest, url.query = splitTwo(rest, '?')

	url.protocol, rest = splicePattern(rest, '^[a-zA-Z][a-zA-Z0-9+-.]*:')

	if _.startsWith(rest, '//') then
		rest = _.slice(rest, 2 + 1)
	end

	rest, url.pathname = splitTwo(rest, '/')
	if not url.pathname then
		url.pathname = ''
	end
	url.pathname = '/' .. url.pathname

	local auth, host = splitTwo(rest, '@')
	if _.empty(host) then
		host = auth
		auth = nil
	end
	url.auth = auth
	
	url.hostname, url.port = splitTwo(host, ':')
	if url.port then
		url.port = tonumber(url.port)
	end

	return url
end

return Url
