declare default element namespace "urn:isbn:1-931666-22-9";

<findingaids>
{
for $ead in collection("file:///c:/Users/Matt/Desktop/xquery-assignment?select=*.xml")
order by count($ead//unittitle) ascending
return
<findingaid>
<id>{data($ead//@identifier)}</id>
<title>{data($ead//titleproper)}</title>
<years_covered>{data(number(substring-after($ead/ead/eadheader[1]/filedesc[1]/titlestmt[1]/titleproper[1]/date, '-')))-number(substring-before($ead/ead/eadheader[1]/filedesc[1]/titlestmt[1]/titleproper[1]/date, '-'))}</years_covered>
<encoder>{data(substring-after($ead/ead/eadheader[1]/filedesc[1]/titlestmt[1]/author[1],'by '))}</encoder>
<number_changes>{data(count($ead//change))}</number_changes>
<extent>{data($ead//extent)}</extent>
<access_restrctions>{string-join($ead//accessrestrict/*, "|")}</access_restrctions>
<index_terms>
{for $corpname in $ead/ead/archdesc[1]/controlaccess[1]/controlaccess[1]/list[1]/item[1]/extref[1]/corpname
return
<index_term>{normalize-space(string-join($ead/ead/archdesc[1]/controlaccess[1]/controlaccess[1]/list[1]/item/extref, ", "))}
</index_term>}
</index_terms>
<number_files>{count($ead//unittitle)}</number_files>
</findingaid>
}
</findingaids>