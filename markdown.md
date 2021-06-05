---
layout: post
title: Markdown Handreichung
date:   2021-06-5
author: 
nav_exclude: true

---

filmprojektor.net arbeitet mit sogenannten Markdown-Dateien (.md), die automatisch in Html konvertiert werden. Dieser Eintrag gibt einen kurzen Überblick über die möglichen Auszeichnungsarten, das Einbinden externer Inhalte und die Angabe der »Metadaten«.


# Metadaten
Die Metadaten werden am Anfang der .md-Datei im sogenannten YAML-front matter festgelegt und jeweils durch drei einfache Bindestriche <code>---</code> abgetrennt. Ein Beispiel:
{% raw %}
<code>--- <br>
layout: post <br>
title:  "Hoffnung"<br>
date:   2021-05-12<br>
categories: post<br>
author: C.G.<br>
subtitle: "Aki Kaurismäki: Der Mann ohne Vergangenheit" <br>
---</code>
{% endraw %}

# Auszeichnungen

Die möglichen Auszeichnungen sind übernommen vom tufte-css und werden <a href="http://clayh53.github.io/tufte-jekyll/articles/20/tufte-style-jekyll-blog">hier</a> 
genauer erläutert. Zu unterscheiden ist zwischen Überschriften, Zitaten und der Marginalienspalte und einfachen Auszeichnungen im Text.

## Auzeichnungen im Text
**Fett darzustellender Text** wird zwischen doppelten Sternchen geschrieben als <code>**fetter Text**</code>.

*Kursiv darzustellender Text* wird zwischen einfachen Sternchen geschrieben als <code>*kursiver Text*</code>.

<br>

## Überschriften

Überschriften werden durch Doppelkreuze <code>#</code> angezeigt; drei Ordnungen sind möglich:

<code># Überschrift</code> gibt eine Überschrift erster Ordnung:

# Überschrift 1

<code>## Überschrift</code> gibt eine Überschrift zweiter Ordnung:

## Überschrift 2

<code>### Überschrift</code> gibt eine Überschrift dritter Ordnung:

### Überschrift 3

<br>

## Zitate
Die Angabe von Zitaten folgt der Syntax:
{% raw %}
<code>{% epigraph 'Ziterter Text' 'Zitierter Autor:in' 'Zitierte Quelle' %}</code>
{% endraw %}
Dargestellt wird das als:
{% epigraph 'Ziterter Text' 'Zitierter Autor:in' 'Zitierte Quelle' %}


## Marginalien
Zwei Arten von Marginalien sind möglich: Nummerierte und unnummerierte Marginalien.

### Unnummerierte Marginalien

Unnummerierte Marginalien folgen der Syntax:
{% raw %}
<code>{% marginnote "mn-id" "Text der unnummerierten Marginalie" %}</code>
{% endraw %}
Als <code>mn-id</code> fungiert als eindeutige Kennzeichnung. Einen Anker gibt es nicht. Die Marginalie folgt der Zeile:
{% marginnote "mn-id" "Text der Marginalie" %}

### Nummerierte Marginalien
Nummerierte Marginalien folgen der Syntax:
{% raw %}
<code>{% sidenote "sn-id" "Text der nummerierten Marginalie" %}</code>
{% endraw %}
Als <code>mn-id</code> fungiert als eindeutige Kennzeichnung. Dargestellt wird das eine nummerierte Marginalie mit einem Anker:
{% sidenote "sn-id" "Text der nummerierten Marginalie" %}

# Externe Inhalte
Sowohl das Einbinden von Videos, als auch von Fotos ist möglich. Den jeweils zu spezifizierenden Pfad würde ich beim hochladen jeweils selbst festlegen.

## Fotos
Fotos können sowohl in der Marginalspalte, als auch im Fließtext und dort entweder über die gesamte Seitenbreite oder bündig zum Text angezeigt werden.

### Bilder in der Marginalspalte
Bilder in der Marginalspalte folgen der Syntax: {% marginfigure "mf-id" "assets/img/rhino.png" "Bildunterschrift: F.J. Cole, “The History of Albrecht Dürer’s Rhinoceros in Zoological Literature,” *Science, Medicine, and History: Essays on the Evolution of Scientific Thought and Medical Practice* (London, 1953), ed. E. Ashworth Underwood, 337-356. From page 71 of Edward Tufte’s *Visual Explanations*." %}
{% raw %}
<code>{% marginfigure "mf-id" "pfad/zum/rhino.png" "Bildunterschrift: F.J. Cole, “The History of Albrecht Dürer’s Rhinoceros in Zoological Literature,” *Science, Medicine, and History: Essays on the Evolution of Scientific Thought and Medical Practice* (London, 1953), ed. E. Ashworth Underwood, 337-356. From page 71 of Edward Tufte’s *Visual Explanations*." %}</code>
{% endraw %}
Die Zeilenhöhe der Oberkante des Bildes richtet sich einfach nach der Angabe im Text.

### Bilder über die Textbreite
Bilder, die bündig zum Text dargestellt werden, werden eingebunden mit
{% raw %}
<code>{% maincolumn "pfad/zum/export-imports.png" "From Edward Tufte, <em>Visual Display of Quantitative Information</em>, page 92" %}</code>
{% endraw %}
Das wird dargestellt als: 
{% maincolumn "assets/img/exports-imports.png" "From Edward Tufte, <em>Visual Display of Quantitative Information</em>, page 92" %}

### Bilder über gesamte Seitenbreite
Ein Bild über die gesamte Seitenbreite wird eingebunden mit 
{% raw %}
<code>{% fullwidth "pfad/zu/napoleons-march.png" "Napoleon's March (Edward Tufte’s English translation)" %}</code>
{% endraw %}
Das wird dargestellt als:
{% fullwidth "assets/img/napoleons-march.png" "Napoleon's March (Edward Tufte’s English translation)" %}

## Videos
Videos können nicht in der Marginalspalte sondern nur auf Text- oder Seitenbreite eingebunden werden; bisher ist nur youtube als Quelle möglich. Die youtube-id lässt sich über die URL ermitteln. In der Url https://www.youtube.com/watch?v=UutshUjBwTY ist die youtube-id bspw. UutshUjBwTY. 

### Videos über die Textbreite
Die Syntax für Videos über die Textbreite lautet:

{% raw %}
<code>{%maincolumn "YOUTUBE:youtubeid" "Moneyboy Interview" %}</code>
{% endraw %}
{%maincolumn "YOUTUBE:UutshUjBwTY" "Moneyboy Interview" %}


### Videos über die gesamte Seitenbreite
Die Syntax für Videos über die gesamte Seitenbreite lautet:
{% raw %}
<code>{%fullwidth, "YOUTUBE:youtubeid" "subtitle" %}</code>
{% endraw %}
Ein Beispiel:
{%fullwidth "YOUTUBE:UutshUjBwTY" "Moneyboy Interview" %}

