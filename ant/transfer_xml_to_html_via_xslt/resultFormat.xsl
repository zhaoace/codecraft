<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
	<xsl:variable name="coveragelink" select="/concatResult/coverage/coverage-link"/>
	<xsl:variable name="utlink" select="/concatResult/coverage/ut-link"/>
	<xsl:variable name="runHtml-link" select="/concatResult/coverage/runHtml-link"/>
    <xsl:variable name="title" select="/concatResult/coverage/title"/>
	<xsl:template match="concatResult">
		<head>
			<xsl:call-template name="CSS"/>
		</head>
		<xsl:apply-templates select="testsuites"/>		
		<xsl:apply-templates select="coverage"/>
	</xsl:template>
	
	
	<xsl:template match="testsuites">
		<TABLE border="1">	
			<caption>
				<h2>
					<a title="">
						<xsl:attribute name="href"><xsl:value-of select="$utlink"/></xsl:attribute><xsl:value-of select="$title"/> Automation Result Summary
					</a>					
				</h2>				
			</caption>
			
			<tr bgcolor="#9acd32">
				<th>Total tests</th>
				<th>Failures</th>
				<th>Errors</th>
				<th>Time</th>
			</tr>
			
			<tr>
				<td><xsl:value-of select="@tests"/></td>	
				
				<xsl:call-template name="td_highlight">
					<xsl:with-param name="checkValue" select="@failures"/>				
				</xsl:call-template>
				<xsl:call-template name="td_highlight">
					<xsl:with-param name="checkValue" select="@errors"/>				
				</xsl:call-template>
				
				<td><xsl:value-of select="@time"/></td>
			</tr>
		</TABLE> 
		
		<TABLE border="1" class="testresult">		
			<caption>
				<h2>
					<a title="">
						<xsl:attribute name="href"><xsl:value-of select="$utlink"/></xsl:attribute>Container API Automation Result Details
					</a>					
				</h2>
			</caption>
			<tr bgcolor="#9acd32">
					<th>Test Suite Name</th>
					<th>Total tests</th>
					<th>Failures</th>
					<th>Errors</th>
					<th>Time</th>
					<th>Result</th>
			</tr>
			
			<xsl:for-each select="testsuite">	
				<xsl:sort select="(@failures + @errors)" order="descending"/>
				<xsl:variable name="index" select="position()"/>
				<xsl:choose>
					<xsl:when test="$index mod 2 = 0">
						<tr class="odd">
							<xsl:call-template name="td_template"/>
						</tr>
					</xsl:when>
					
					<xsl:otherwise>
						<tr class="even">
							<xsl:call-template name="td_template"/>
						</tr>
					</xsl:otherwise>
				</xsl:choose>
				
					
				
			</xsl:for-each>
		</TABLE> 
	</xsl:template>
	
	<xsl:template match="coverage">
		<TABLE border="1">	
			<caption>
				<h2>
					<a title="">
						<xsl:attribute name="href"><xsl:value-of select="$coveragelink"/></xsl:attribute>JSCoverage Summary Report
					</a>
				</h2>
			</caption>
			
			<tr bgcolor="#9acd32">
				<th>line-rate</th>
				<th>branch-rate</th>
				<th>lines-covered</th>
				<th>lines</th>
				<th>branches-covered</th>
				<th>branches</th>
			</tr>
			
			<tr>
				<td><xsl:value-of select="round(line-rate*100)"/></td>
				<td><xsl:value-of select="round(branch-rate*100)"/></td>
				<td><xsl:value-of select="lines-covered"/></td>
				<td><xsl:value-of select="lines"/></td>
				<td><xsl:value-of select="branches-covered"/></td>
				<td><xsl:value-of select="branches"/></td>
			</tr>
		</TABLE> 
	</xsl:template>
	
	<xsl:template name="CSS">
		<style type="text/css">			
			table 
			{	
				  font-family:"Trebuchet MS", Arial, Helvetica, sans-serif;
				  width:100%;
				  border-collapse:collapse;  
				  margin: 30px 0;
				  padding:30px 0;
			}
			
			table caption
			{
				background-color:white;
				color:blue;
			}
			
			table td, table th 
			  {
				  font-size:1em;
				  border:1px solid #98bf21;
				  padding:3px 7px 2px 7px;
			  }
			 
			 table th 
			  {
				  font-size:1.1em;
				  text-align:left;
				  padding-top:5px;
				  padding-bottom:4px;
				  background-color:#A7C942;
				  color:#ffffff;
			  }

			table tr.odd td 
			  {
				  color:#000000;
				  background-color:#EAF2D3;
			  }
			  
			table tr td.goodresult
			{
				background-color:green;
			}
			
			table tr td.badresult
			{
				background-color:red;
			}
		</style>
	</xsl:template>
	
	<xsl:template name="td_template">
		<td>
			<a title="">
						<xsl:attribute name="href"><xsl:value-of select="concat($runHtml-link, '?module=', @name)"/></xsl:attribute><xsl:value-of select="@name"/>
			</a>			
		</td>
		<td><xsl:value-of select="@tests"/></td>
		<td><xsl:value-of select="@failures"/></td>
		<td><xsl:value-of select="@errors"/></td>
		<td><xsl:value-of select="@time"/></td>
		
		<xsl:call-template name="td_highlight">
			<xsl:with-param name="checkValue" select="@failures + @errors"/>				
			<xsl:with-param name="testsuitname" select="@name"/>				
		</xsl:call-template>
	</xsl:template>
	
	<xsl:template name="td_highlight">
		<xsl:param name="checkValue"/>				
		<xsl:param name="testsuitname"/>				
		<xsl:choose>
			<xsl:when test="$checkValue &gt; 0">
				<td class="badresult">
					<a title="">
						<xsl:attribute name="href"><xsl:value-of select="concat($runHtml-link, '?module=', $testsuitname)"/></xsl:attribute><xsl:value-of select="$checkValue"/>
					</a>		
				</td>
			</xsl:when>
			<xsl:otherwise>
				<td class="goodresult">
					<a title="">
						<xsl:attribute name="href"><xsl:value-of select="concat($runHtml-link, '?module=', $testsuitname)"/></xsl:attribute><xsl:value-of select="$checkValue"/>
					</a>
				</td>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
