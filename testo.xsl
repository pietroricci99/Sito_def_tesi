<?xml version="1.0" encoding="UTF-8" indent="yes"?>

<xsl:stylesheet version="3.0"           
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" 
 	xmlns:ixsl="http://saxonica.com/ns/interactiveXSLT"
    xmlns:h="http://www.w3.org/1999/xhtml"
    xmlns:js="http://saxonica.com/ns/globalJS"
    xmlns:saxon="http://saxon.sf.net/"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.w3.org/1999/xhtml">

<!--<xsl:stylesheet version="2.0"
      xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
      xmlns:tei="http://www.tei-c.org/ns/1.0"
      xmlns="http://www.w3.org/1999/xhtml"
      xmlns:ixsl="http://saxonica.com/ns/interactiveXSLT" 
      > --> 

    <xsl:output method="html" html-version="5" encoding="utf-8" indent="no"/> <!-- Definizione del formato del documento di output -->
    <xsl:param name="id" />

    <xsl:template match="/">
        <xsl:result-document href="#testo"> 
            <xsl:apply-templates select="tei:TEI/tei:text/tei:body/tei:div" />
        </xsl:result-document>
        
        <xsl:result-document href="#testo" method="ixsl:append-content">
            <p id="click">Cliccami</p>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="tei:TEI/tei:text/tei:body/tei:div[@xml:id=$id]">
        <xsl:value-of select="tei:p "/>
    </xsl:template>

    <xsl:template match="//tei:text/tei:body/tei:div/tei:p/tei:lb">
            <br />
    </xsl:template>
    <!--TEMPLATE PER LE CANCELLATURE-->
    <xsl:template match="//tei:del[@rend='overstrike']">
    <span style="text-decoration: line-through">
    <xsl:value-of select="."/></span>
    </xsl:template>
    <!--TEMPLATE PER GLI ELEMENTI TERMINOLOGICI-->
    <xsl:template match="//tei:term">
        <span style="color:red">
        <xsl:value-of select="."/></span>
    </xsl:template>
    <!--TEMPLATE PER I NOMI PROPRI-->
    <xsl:template match="//tei:name[@type='person']">
        <span style="color: #ff00ff ">
        <xsl:value-of select="."/></span>
    </xsl:template>
    <!--TEMPLATE CHE SOTTOLINEA E COLORA DI GIALLO I TERMINI FRANCESI-->
    <xsl:template match="//tei:foreign[@xml:lang='fr']">
        <span style= "color:yellow; text-decoration:underline"> 
        <xsl:value-of select="."/></span>
    </xsl:template>
    <!--TEMPLATE CHE SOTTOLINEA E COLORA DI GIALLO I TERMINI TEDESCHI-->
    <xsl:template match="//tei:mentioned[@xml:lang='ger']">
        <span style="color:lime, text-decoration: underline">
        <xsl:value-of select="."/></span>
    </xsl:template>
    <!--TEMPLATE PER I NOMI DI LUOGO-->
    <xsl:template match="//tei:placeName">
        <span style="color:green">
        <xsl:value-of select="."/></span>
    </xsl:template>
    <!--TEMPLATE PER LE CITAZIONI DI DANTE + aggiunta-->
    <xsl:template match="//tei:hi">
        <span style="Color: #0066ff"><xsl:attribute name="id"><xsl:value-of select="."/></xsl:attribute>
        <xsl:value-of select="."/></span>
    </xsl:template>

    
    <xsl:template mode="ixsl:onclick" match="h:p[@id='click']" >
        <xsl:result-document href="#click" method="ixsl:replace-content">
            <b id="testo">Il diario è un dattiloscritto di 86 pagine dove la narrazione scorre fluida, 
                infatti gli unici eventi che vengono datati sono ricorrenze specifiche come Natale o Pasqua.
                I fatti del diario sono stati prima appuntati su fogli volanti e poi Nicola, negli anni di permanenza in polizia, 
                ha battuto a macchina i suoi appunti e li ha riordinati in un ordine cronologicamente coerente. 
                Il diario contiene varie sequenze che consentono a chi legge di comprendere sia le dinamiche sociali proprie della 
                Francia occupata, sia le dinamiche relazionali all'interno del campo di concentramento.
            </b>
        </xsl:result-document>
    </xsl:template>

    <!--TEMPLATE PER LE CITAZIONI ESPLICITE-->
    <xsl:template match="//tei:cit/tei:q">
        <span style="Color: orange">
        <xsl:value-of select="."/></span>
    </xsl:template>
    <!--TEMPLATE PER NASCONDERE BIBL-->
    <xsl:template match="//tei:cit/tei:bibl">
        <span style ="display:none"/>
    </xsl:template>
    <!--TEMPLATE PER I DISCORSI DIRETTI-->
    <xsl:template match="//tei:said">
        <span style="color:Aqua">
        <xsl:value-of select="."/></span>
    </xsl:template>
    <!--TEMPLATE PER  LE DATE-->
    <xsl:template match="//tei:date">
        <span style="color:#ffcccc">
        <xsl:value-of select="."/></span>
    </xsl:template>
    <!--TEMPLATE PER LE SOSTITUZIONI DI CARATTERE-->
    <xsl:template match="//tei:del[@rend='overtype']">
        <span style="text-decoration: line-through">
        <xsl:value-of select="."/></span>
    </xsl:template>
    <!--TEMPLATE PER EVIDENZIARE I CARATTERI AGGIUNTI-->
        <xsl:template match="//tei:add">
        <span style="color:brown">
        <xsl:value-of select="."/></span>
    </xsl:template>

    <xsl:template match="//tei:expan">
        <span style="display:none"/>
    </xsl:template>


</xsl:stylesheet>