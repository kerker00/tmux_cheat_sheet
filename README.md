# tmux_cheat_sheet

Eine persoenliche Sammlung von tmux-Kommandos und eine dazu passende Konfiguration.
Der Schwerpunkt liegt auf einer ruhigen, schnell bedienbaren Terminal-Umgebung mit
gut sichtbarem aktivem Pane und Fenster.

## Voraussetzungen

- [tmux](https://github.com/tmux/tmux) ist installiert.
- Die Shell verwendet die ueblichen tmux-Tastenkombinationen.

Auf macOS kann tmux zum Beispiel mit Homebrew installiert werden:

```bash
brew install tmux
```

## Installation

Das Installationsskript kopiert die Konfiguration nach `~/.tmux.conf`:

```bash
./install.sh
```

Das Skript ueberschreibt eine bereits vorhandene `~/.tmux.conf`. Bei einer
bestehenden Konfiguration sollte deshalb vorher eine Sicherung angelegt werden:

```bash
cp ~/.tmux.conf ~/.tmux.conf.backup
./install.sh
```

Eine laufende tmux-Session liest die Datei nicht automatisch neu ein. Die
Konfiguration kann innerhalb von tmux neu geladen werden:

```text
Ctrl+a :
source-file ~/.tmux.conf
Enter
```

Alternativ kann tmux aus der Shell heraus neu geladen werden:

```bash
tmux source-file ~/.tmux.conf
```

## Bedienmodell

Der tmux-Prefix ist in dieser Konfiguration `Ctrl+a` statt des tmux-Standards
`Ctrl+b`. Eine Tastenkombination wird daher normalerweise in zwei Schritten
ausgefuehrt: zuerst `Ctrl+a`, danach die eigentliche Taste. In der Dokumentation
unter [tmux.md](tmux.md) wird dieser Prefix als `Prefix` bezeichnet.

Die Kombination

```text
Ctrl+a Ctrl+a
```

gibt `Ctrl+a` an das Programm im Pane weiter. Das ist wichtig, wenn eine Shell,
ein Editor oder ein anderes Terminalprogramm selbst diese Tastenkombination
verwendet.

## Schwerpunkt der Konfiguration

### Tastenkombinationen

Der Prefix `Ctrl+a` liegt ergonomisch nahe an der linken Hand und ist fuer viele
Nutzer leichter erreichbar als `Ctrl+b`. Die Standardbelegung fuer horizontale
und vertikale Splits wird entfernt und durch leicht merkbare Zeichen ersetzt:

```text
Prefix |    horizontales Split
Prefix -    vertikales Split
```

Das Zeichen `|` beschreibt dabei die optische Trennlinie zwischen zwei Panes,
`-` die horizontale Trennlinie. Die Belegung folgt also dem Ergebnis des Befehls
und nicht einer schwer zu merkenden Standardtaste.

### Mausunterstuetzung

```tmux
set -g mouse on
```

Mit aktivierter Maus koennen Fenster und Panes angeklickt, Pane-Grenzen gezogen
und der Scrollback direkt bedient werden. Die Tastatur bleibt fuer wiederholte
Aktionen schneller, die Maus ist aber praktisch fuer gelegentliche Auswahl und
Groessenanpassung.

### Ruhiges Verhalten bei Terminal-Ereignissen

Die Optionen `visual-activity`, `visual-bell`, `visual-silence` und
`monitor-activity` sind deaktiviert. Auch `bell-action` ist auf `none` gesetzt.

Damit erzeugen Hintergrundaktivitaet, Stille oder ein Terminal-Bell keine
stoerenden visuellen oder akustischen Hinweise. Das ist besonders nuetzlich,
wenn mehrere Fenster oder lang laufende Prozesse gleichzeitig aktiv sind und
nicht jede Statusaenderung Aufmerksamkeit erfordert.

### Visuelle Orientierung

Die Farbgebung soll nicht dekorativ sein, sondern den aktuellen Zustand schnell
erkennbar machen:

- Das aktive Pane hat einen gelben Rand, inaktive Panes einen roten Rand.
- Das aktive Fenster wird mit schwarzer Schrift auf rotem Hintergrund markiert.
- Inaktive Fenster verwenden eine dunkle Flaeche mit roter Schrift.
- Meldungen erscheinen gelb auf rot und sind dadurch auch bei kurzen tmux-
	Rueckmeldungen gut sichtbar.
- Die Uhr im Clock Mode verwendet Gelb als Akzentfarbe.

Das aktive Element ist damit auf zwei Ebenen sichtbar: am Pane-Rand und in der
Fensterleiste. Gerade bei vielen parallelen Shells reduziert das die Gefahr,
versehentlich im falschen Pane zu arbeiten.

### Statusleiste

Die Statusleiste bleibt unten und richtet ihre Fenster links aus. Links wird
kein zusaetzlicher Text angezeigt; rechts stehen Datum und Uhrzeit im Format
`YYYY-MM-DD HH:MM`.

Die Fensteranzeige enthaelt:

- die Fensternummer (`#I`),
- den Fensternamen (`#W`),
- Statusmarker wie Aktivitaet oder Zoom (`#F`).

Das haelt die Leiste kompakt und liefert trotzdem die Informationen, die beim
Wechsel zwischen mehreren Arbeitskontexten benoetigt werden.

### Copy Mode

Der Copy Mode verwendet einen dunklen Text auf orangefarbenem Hintergrund. Die
Auswahl hebt sich damit deutlich vom normalen Terminalinhalt ab. Er wird mit

```text
Prefix [
```

geoeffnet; mit `Prefix ]` wird der zuletzt kopierte Inhalt eingefuegt. Weitere
Bedienkombinationen und Suchbefehle stehen im [Cheatsheet](tmux.md).

## Dateien

| Datei | Zweck |
| --- | --- |
| [`tmux.conf`](tmux.conf) | Eigentliche tmux-Konfiguration |
| [`tmux.md`](tmux.md) | Tastenkombinationen und CLI-Kommandos |
| [`install.sh`](install.sh) | Kopiert die Konfiguration nach `~/.tmux.conf` |

## Hintergrund

tmux trennt die laufende Terminal-Session vom sichtbaren Terminalfenster. Eine
Session kann daher weiterlaufen, waehrend die Verbindung geschlossen oder das
Terminal-Fenster beendet wird. Spaeter kann sie mit `tmux attach` wieder
uebernommen werden.

Die Konfiguration konzentriert sich deshalb auf drei Dinge: schnelle Navigation
zwischen Panes und Fenstern, eindeutige Rueckmeldung ueber den aktuellen Fokus
und moeglichst wenig unaufgeforderte Ablenkung. Die tmux-Befehle selbst sind im
[Cheatsheet](tmux.md) gesammelt; diese README erklaert vor allem, warum die
Konfiguration so aufgebaut ist.
