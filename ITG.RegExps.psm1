[System.Text.RegularExpressions.Regex]$reDomain = `
	"(?<domain>(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+(?:aero|asia|biz|cat|com|coop|edu|gov|info|int|jobs|mil|mobi|museum|name|net|org|pro|tel|travel|[a-zA-Z]{2}))";
[System.Text.RegularExpressions.Regex]$reMailAddr = `
	"(?<addr>(?<lname>[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+)*)@$($reDomain))";

[System.Text.RegularExpressions.Regex]$rePort = `
	"(?:[:](?<port>\d+))";
[System.Text.RegularExpressions.Regex]$reSocket = `
	"(?<socket>${reDomain}${rePort}?)";
[System.Text.RegularExpressions.Regex]$reSchema = `
	"(?<schema>http|https|ftp)";
[System.Text.RegularExpressions.Regex]$reURLToken = `
	"(?:(?:%[0-9a-fA-F]{2})|[a-zA-Z0-9!$'*+^_`{|}~.`-]|&[a-z]+;)";
[System.Text.RegularExpressions.Regex]$reURLPathEl = `
	"${reURLToken}+";
[System.Text.RegularExpressions.Regex]$reURLPath = `
	"(?<path>${reURLPathEl}(?:/${reURLPathEl})*)";
[System.Text.RegularExpressions.Regex]$reURLParam = `
	"(?<paramName>${reURLToken}+)=(?<paramValue>${reURLToken}+)";
[System.Text.RegularExpressions.Regex]$reURLParams = `
	"(?:(?:[?])(?<params>${reURLParam}(?:&${reURLParam})*))";
[System.Text.RegularExpressions.Regex]$reURLAnchor = `
	"(?:(?:#)(?<anchor>${reURLToken}+))";
[System.Text.RegularExpressions.Regex]$reURL = `
	"(?<url>${reSchema}://${reDomain}${rePort}?(?:/${reURLPath}?${reURLParams}?${reURLAnchor}?)?)";
[System.Text.RegularExpressions.Regex]$reURLShortHTTP = `
	"(?<url>(?<domain>(?:www)`.${reDomain})${rePort}?(?:/${reURLPath}?${reURLParams}?${reURLAnchor}?)?)";
[System.Text.RegularExpressions.Regex]$reURLShortFTP = `
	"(?<url>(?<domain>(?:ftp)`.${reDomain})${rePort}?(?:/${reURLPath}?${reURLParams}?${reURLAnchor}?)?)";

Export-ModuleMember `
	-Variable `
		  reDomain `
		, reMailAddr `
		, rePort `
		, reSocket `
		, reSchema `
		, reURLToken `
		, reURLPathEl `
		, reURLPath `
		, reURLParam `
		, reURLParams `
		, reURLAnchor `
		, reURL `
		, reURLShortHTTP `
		, reURLShortFTP `
;