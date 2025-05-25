<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
   xmlns:html="http://www.w3.org/1999/xhtml" exclude-result-prefixes="xs tei html" version="2.0">
   <xsl:output method="html" indent="yes"/>
   
   <xsl:template match="tei:label"/>
   <xsl:template match="tei:figDesc"/>
   
   <xsl:template match="tei:TEI">
      <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
      <xsl:text>&#xa;</xsl:text>
      <html lang="en" xml:lang="en">
         <head>
            <title>
               DCHM Template: Home </title>
            <link rel="stylesheet"
               href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
               integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
               crossorigin="anonymous"/>
            <link rel="stylesheet" href="assets/css/main.css"/>
            <link rel="stylesheet" href="assets/css/desktop.css"/>
         </head>
         <body>
            <header>
               <h1>
                  <xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
               </h1>
            </header>
            <nav id="sitenav">
               <a href="Index.html">Om projektet</a> | <a href="Affisch1926HTML.html">Affisch
                  1926</a> | <a href="Affisch1927HTML.html">Affisch 1927</a> | <a
                     href="Affisch1930HTML.html">Affisch 1930</a> | <a href="Affisch1931HTML.html"
                        >Affisch 1931</a>| </nav>
            <main id="manuscript">
               <div class="container">
                  <div class="row"> <div class="row align-items-start"> <div class="col-sm" id="image-block">
                           <img class="img-half mb-2" alt="AI bild som visar storlek på affischen">
                              <xsl:attribute name="src">
                                 <xsl:value-of select="tei:facsimile/tei:surface[@xml:id='bakgrundsbild']/tei:figure/tei:graphic/@url"/>
                              </xsl:attribute>
                           </img>
                           <p class="image-caption">
                              <strong>AI-genererad bild som visas i affischstorlek.</strong> <br/>Som mycket av kurslitteraturen påpekar är det ofta svårt att kommunicera materialiteten när man digitaliserar objekt. Som ett försök att kompensera för detta har vi därför med hjälp av AI skapat en bild som visar storleken på en av affischerna. Affischen är storleksanpassad i förhållande till längden på personen till höger som antas vara 174 cm lång. Omgivningarna är skapade utifrån upphovsrättsfria offentliga historiska bilder av 1930-talets Stockholm med hjälp av Photoshops AI-funktion. 
                           </p>
                  </div>
                        <div class="col-sm">
                           <article id="description">
                              <xsl:apply-templates select="tei:text/tei:body/*"/>
                           </article>
                        </div>
                  </div> </div> <div class="row">
                     <div class="col-sm">
                        <article id="details">
                           <p><strong>Författare:</strong><br/> Nanna Meyer, Ellinor Sjöblom, Kateryna Virko, Veronica Zander </p>
                        </article>
                     </div>
                  </div>
               </div>
            </main>
            <footer>
               <div class="row" id="footer">
                  <div class="col-sm copyright">
                     <div class="copyright_logos">
                        <a href="https://creativecommons.org/licenses/by/4.0/legalcode">
                           <img src="assets/img/logos/cc.svg" class="copyright_logo"
                              alt="Creative Commons License"/>
                           <img src="assets/img/logos/by.svg" class="copyright_logo"
                              alt="Attribution 4.0 International"/>
                        </a>
                     </div>
                     <div class="copyright_text"> </div>
                  </div>
               </div>
            </footer>
            <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"/>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"/>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"/>
         </body>
      </html>
   </xsl:template>
   
   <xsl:template match="tei:head">
      <h2>
         <xsl:apply-templates/>
      </h2>
   </xsl:template>
   
   <xsl:template match="tei:p">
      <p>
         <xsl:apply-templates/>
      </p>
   </xsl:template>
   
   <xsl:template match="tei:ref">
      <a>
         <xsl:attribute name="href">
            <xsl:value-of select="@target"/>
         </xsl:attribute>
         <xsl:attribute name="target">_blank</xsl:attribute>
         <xsl:value-of select="."/>
      </a>
   </xsl:template>
   
</xsl:stylesheet>