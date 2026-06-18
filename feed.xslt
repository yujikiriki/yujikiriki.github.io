<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:atom="http://www.w3.org/2005/Atom">

  <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/">
    <html lang="es">
      <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <title><xsl:value-of select="/atom:feed/atom:title"/> — feed</title>
        <style>
          *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
          body {
            background: #222222;
            color: #f2f2f2;
            font-family: "Literata", Palatino, "Palatino Linotype", Georgia, serif;
            font-size: 16px;
            line-height: 1.6;
            max-width: 700px;
            margin: 0 auto;
            padding: 3rem 1.5rem 4rem;
          }
          a { color: #dadbdb; }
          a:hover { color: #fff; }
          .feed-header { margin-bottom: 3rem; border-bottom: 1px solid #333; padding-bottom: 1.5rem; }
          .feed-header h1 { font-size: 1.8rem; font-weight: 400; margin-bottom: 0.4rem; }
          .feed-header p { color: #aaa; font-size: 0.95rem; }
          .feed-header .subscribe {
            display: inline-block;
            margin-top: 1rem;
            font-size: 0.85rem;
            color: #888;
            border: 1px solid #444;
            border-radius: 3px;
            padding: 0.25rem 0.6rem;
          }
          .entry { margin-bottom: 2.2rem; }
          .entry h2 { font-size: 1.15rem; font-weight: 400; margin-bottom: 0.25rem; }
          .entry h2 a { text-decoration: none; }
          .entry h2 a:hover { text-decoration: underline; }
          .entry .meta { font-size: 0.82rem; color: #888; margin-bottom: 0.5rem; }
          .entry .summary { font-size: 0.95rem; color: #ccc; }
        </style>
      </head>
      <body>
        <div class="feed-header">
          <h1>
            <xsl:value-of select="/atom:feed/atom:title"/>
          </h1>
          <p><xsl:value-of select="/atom:feed/atom:subtitle"/></p>
          <a class="subscribe" href="{/atom:feed/atom:link[@rel='alternate']/@href}">
            ← ver sitio
          </a>
        </div>

        <xsl:for-each select="/atom:feed/atom:entry">
          <div class="entry">
            <h2>
              <a href="{atom:link[@rel='alternate']/@href}">
                <xsl:value-of select="atom:title"/>
              </a>
            </h2>
            <div class="meta">
              <xsl:value-of select="substring(atom:published, 1, 10)"/>
              <xsl:if test="atom:author/atom:name">
                &#160;·&#160;<xsl:value-of select="atom:author/atom:name"/>
              </xsl:if>
            </div>
            <xsl:if test="atom:summary">
              <div class="summary">
                <xsl:value-of select="atom:summary" disable-output-escaping="yes"/>
              </div>
            </xsl:if>
          </div>
        </xsl:for-each>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
