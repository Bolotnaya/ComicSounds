<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
	<html>
	<body>
		<h2>Звуки</h2>
		<table border="1">
			<tr bgcolor="#9acd32">
				<th style="text-align:left">Звук</th>
				<th style="text-align:left">Использование</th>
				<th style="text-align:left">Перевод</th>
			</tr>
			<xsl:for-each select="sounds/sound">
				<tr>
					<td>
						<b>
							<xsl:value-of select="@name"/>
						</b>
					</td>
					<td>
						<xsl:for-each select="./usage">
							<xsl:value-of select="@description"/>; 
						</xsl:for-each>
					</td>
					<td>
						<xsl:for-each select="./usage">
							<xsl:for-each select="./original">
								<xsl:value-of select="."/> (<xsl:value-of select="@language"/>); 
							</xsl:for-each>
						</xsl:for-each>
					</td>
				</tr>
			</xsl:for-each>
		</table>
		<br />
		<h2>По категориям</h2>
		<table border="1">
			<tr bgcolor="#9acd32">
				<th style="text-align:left">Категория</th>
				<th style="text-align:left">Звуки</th>
			</tr>
			<xsl:for-each select="/sounds/sound/usage/class[not(.=../../preceding-sibling::*/usage/class) and not(.=../preceding-sibling::*/class)]">
				<tr>
					<td><b>
						<xsl:value-of select="."/>
					</b></td>
					<td>
						<xsl:for-each select="/sounds/sound[usage/class = current()]">
							<xsl:value-of select="@name"/>; 
						</xsl:for-each>
					</td>
				</tr>
			</xsl:for-each>
		</table>
	</body>
	</html>
</xsl:template>
</xsl:stylesheet>
