---
layout: post
title: "Matthew Malher: XPath Homework"
date: 2018-02-01
---
<ol>
<li>//div[1]/@id</li>
<li>XPath: count(//list) Answer: 1</li>
<li>//availability/p[1]</li>
<li>  
<ol>
	<li type="1">//publicationStmt/publisher | //publicationStmt/pubPlace</li>
	<li type="1">//publicationStmt/*[self::publisher or self::pubPlace]</li>
</ol>
</li>
<li>XPath: count(//body//p) Answer: 34</li>
<li>XPath: distinct-values(//region[@reg]) Answer: Indiana, Ohio, South Carolina, Kentucky, Arkansas, North Carolina</li>
<li>XPath: count(distinct-values(//settlement[@reg])) Answer: 25</li>
<li>XPath: count(//text()[contains(.,'Evansville')]) Answer: 2</li>
<li>count(//text()[contains(.,'By')])</li>
</ol>	
