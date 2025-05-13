<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:tei="http://www.tei-c.org/ns/1.0"
   version="2.0">
   <xsl:output method="html" encoding="UTF-8" indent="yes"/>
   
   <!-- Huvudmall -->
   <xsl:template match="tei:TEI">
      <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;&#xa;</xsl:text>
      <html lang="en" xml:lang="en">
         <head>
            <title>DCHM Template: Diplomatic View</title>
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" crossorigin="anonymous"/>
            <link rel="stylesheet" href="assets/css/main.css"/>
            <link rel="stylesheet" href="assets/css/desktop.css"/>
            
            <!-- Inline CSS för att minska textstorlek -->
            <style>
               body {
               font-size: 0.9rem;  /* Minska fontstorleken för hela body */
               }
               .tei-body {
               font-size: 0.85rem;  /* Minska fontstorleken för texten i body */
               }
            </style>
         </head>
         <body>
            <header>
               <!-- Inget titleStmt här -->
            </header>
            
            <nav id="sitenav" class="text-center">
               <a href="index.html">Home</a> |
               <a href="diplomatic.html">Diplomatic Transcription</a> |
               <a href="reading.html">Reading Text</a> |
               <a href="affisch_1930.html">Affisch 1930</a>
            </nav>
            
            <main id="manuscript">
               <div class="container">
                  <div class="row">
                     <div class="col-sm">
                        <h3 style="font-size: 1.5rem;">Bild</h3>
                        <!-- Bild under "Images" -->
                        <img class="img-fluid" src="https://github.com/VeronicaBoras/Digitaliseringsprojekt/blob/main/collection/img/Poster_1_final_IMG_1653_6_web.png?raw=true" alt="Affisch 1930" />
                     </div>
                     <div class="col-sm"></div>
                     <div class="col-sm">
                        <h3 style="font-size: 1.5rem;">Transkribering</h3>
                        <article class="transcription">
                           <!-- Här kommer transkriptionen -->
                           <xsl:apply-templates select="//tei:text/tei:body"/>
                        </article>
                     </div>
                  </div>
               </div>
            </main>
            
            <footer>
               <div class="row" id="footer">
                  <div class="col-sm copyright">
                     <a href="https://creativecommons.org/licenses/by/4.0/legalcode">
                        <img src="assets/img/logos/cc.svg" class="copyright_logo" alt="Creative Commons License"/>
                        <img src="assets/img/logos/by.svg" class="copyright_logo" alt="Attribution 4.0 International"/>
                     </a>
                  </div>
               </div>
            </footer>
            
            <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
         </body>
      </html>
   </xsl:template>
   
   <!-- Dölj metadata -->
   <xsl:template match="tei:teiHeader"/>
   
   <!-- Hantera body korrekt -->
   <xsl:template match="tei:body">
      <div class="tei-body">
         <xsl:apply-templates/>
      </div>
   </xsl:template>
   
   <!-- Rubriker -->
   <xsl:template match="tei:head">
      <h2><xsl:apply-templates/></h2>
   </xsl:template>
   
   <!-- Stycken -->
   <xsl:template match="tei:p">
      <p><xsl:apply-templates/></p>
   </xsl:template>
   
   <!-- Radbrytningar -->
   <xsl:template match="tei:lb">
      <br/>
   </xsl:template>
   
   <!-- Halvrader -->
   <xsl:template match="tei:seg[@type='halfline']">
      <span class="halfline">
         <xsl:apply-templates/>
         <br/>
      </span>
   </xsl:template>
   
   <!-- Länkar -->
   <xsl:template match="tei:ref">
      <a target="_blank">
         <xsl:attribute name="href">
            <xsl:value-of select="@target"/>
         </xsl:attribute>
         <xsl:apply-templates/>
      </a>
   </xsl:template>
   
   <!-- Andra markup-element -->
   <xsl:template match="tei:del">
      <del><xsl:apply-templates/></del>
   </xsl:template>
   
   <xsl:template match="tei:add">
      <sup><xsl:apply-templates/></sup>
   </xsl:template>
   
   <xsl:template match="tei:hi[@rend='u']">
      <u><xsl:apply-templates/></u>
   </xsl:template>
</xsl:stylesheet>