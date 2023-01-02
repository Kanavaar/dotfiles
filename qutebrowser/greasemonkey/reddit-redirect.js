/*
DESCRIPTION: This is a file that after installing a greasemonkey
extension can be used to convert reddit.com to libreddit.
NOTE: I might change this really often because instances may fail.
----
Copyright (C) 2021 Zortazert and other contributors
This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or (at
your option) any later version.
This program is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
General Public License for more details.
You should have received a copy of the GNU General Public License
along with this program. If not, see <https://www.gnu.org/licenses/>.
*/

// ==UserScript==
// @name           reddit to librarian
// @namespace      Zera's userscripts
// @match          http://reddit.com/*
// @match          https://reddit.com/*
// @match          http://www.reddit.com/*
// @match          https://www.reddit.com/*
// @run-at         document-start
// ==/UserScript==
url = location.href
url = url.replace(/\bwww\.\b/, "")
url = url.replace("reddit.com","libreddit.tiekoetter.com")
location.href = url

