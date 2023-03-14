��    6      �  I   |      �  �  �  O  �  q   �	  "   `
  -   �
     �
     �
     �
     �
     �
       &         G     X  !   m     �     �  %   �     �     �       &        >  )   K     u     �     �     �  I   �          3     B  2   O  
   �     �     �     �     �  "   �  )   �  &   !     H     ]      |  ,   �  ,   �     �       
   
               #     2  Z  7  �  �    !  k   1  '   �  =   �               2  "   G     j     �     �     �     �  1   �       +   7  9   c  
   �     �     �     �     �  )   �      !     B      T     u  i   �     �       	   &  :   0     k     t     �     �     �  $   �  "   �  *        9  0   S  $   �  -   �  =   �          !     (     6     ;     L     ]           1                '      +   5   0   $   "             /                   %      &       2       	   3       #      (                 .   *      !                        4               )             6   ,      
                    -                      
Controlling the shar headers:
  -n, --archive-name=NAME   use NAME to document the archive
  -s, --submitter=ADDRESS   override the submitter name
  -a, --net-headers         output Submitted-by: & Archive-name: headers
  -c, --cut-mark            start the shar with a cut line

Selecting how files are stocked:
  -M, --mixed-uuencode         dynamically decide uuencoding (default)
  -T, --text-files             treat all files as text
  -B, --uuencode               treat all files as binary, use uuencode
  -z, --gzip                   gzip and uuencode all files
  -g, --level-for-gzip=LEVEL   pass -LEVEL (default 9) to gzip
  -Z, --compress               compress and uuencode all files
  -b, --bits-per-code=BITS     pass -bBITS (default 12) to compress
 
Giving feedback:
      --help              display this help and exit
      --version           output version information and exit
  -q, --quiet, --silent   do not output verbose messages locally

Selecting files:
  -p, --intermix-type     allow -[BTzZ] in file lists to change mode
  -S, --stdin-file-list   read file list from standard input

Splitting output:
  -o, --output-prefix=PREFIX    output to file PREFIX.01 through PREFIX.NN
  -l, --whole-size-limit=SIZE   split archive, not files, to SIZE kilobytes
  -L, --split-size-limit=SIZE   split archive, or files, to SIZE kilobytes
 
Option -o is required with -l or -L, option -n is required with -a.
Option -g implies -z, option -b implies -Z.
 %s is probably not a shell archive %s looks like raw C code, not a shell archive %s: Illegal ~user %s: No `begin' line %s: No `end' line %s: No user `%s' %s: Not a regular file %s: Short file -C is being deprecated, use -Z instead Cannot access %s Cannot chdir to `%s' Cannot get current directory name Cannot open file %s Cannot use -a option without -n Cannot use -l or -L option without -o Closing `%s' Could not fork Created %d files
 DEBUG was not selected at compile time File %s (%s) Found no shell commands after `cut' in %s Found no shell commands in %s Hard limit %dk
 In shar: remaining size %ld
 Limit still %d
 Mandatory arguments to long options are mandatory for short options too.
 Newfile, remaining %ld,  No input files Opening `%s' PLEASE avoid -X shars on Usenet or public networks Read error Saving %s (%s) Soft limit %dk
 Starting `sh' process Starting file %s
 The `cut' line was followed by: %s Too many directories for mkdir generation Try `%s --help' for more information.
 Usage: %s [FILE]...
 Usage: %s [INFILE] REMOTEFILE
 Usage: %s [OPTION]... [FILE]...
 WARNING: No user interaction in vanilla mode WARNING: Non-text storage options overridden Write error binary compressed empty gzipped standard input text Date: 1995-08-02 02:00:57+0200
From: Ulrich Drepper <drepper@myware>
Xgettext-Options: --default-domain=sharutils --output-dir=. --add-comments --keyword=_
Files: ../../po/../lib/error.c ../../po/../lib/getopt.c
	 ../../po/../lib/xmalloc.c ../../po/../src/shar.c
	 ../../po/../src/unshar.c ../../po/../src/uudecode.c
	 ../../po/../src/uuencode.c
 
Inhoud van de shar-kop:
  -n, --archive-name=NAAM  geef het archief de (informatieve) naam NAAM
  -s, --submitter=ADRES    vervang de naam van de archivaris door ADRES
  -a, --net-headers        voeg kopregels Submitted-by: en Archive-name: toe
  -c, --cut-mark           begin de shar met een `cut' regel

Hoe bestanden behandeld worden:
  -M, --mixed-uuencode         laat shar beslissen of uuencode nodig is
                               (dit is de standaard)
  -T, --text-files             alle bestanden zijn tekstbestanden
  -B, --uuencode               alle bestanden zijn binair, gebruik uuencode
  -z, --gzip                   pas gzip en uuencode toe op alle bestanden
  -g, --level-for-gzip=NIVEAU  gebruik gzip mit optie -NIVEAU (standaard -9)
  -Z, --compress               pas compress en uuencode toe op alle bestanden
  -b, --bits-per-code=BITS     gebruik compress met -BITS (standaard -12)
 
Programma informatie:
      --help              vertoon alleen deze hulptekst
      --version           vertoon alleen de programmaversie
  -q, --quiet, --silent   praat hier niet te veel

Bestandskeuze:
  -p, --intermix-type     sta -[BTzZ] toe in de bestandslijst om halverwege
                          van mode te veranderen
  -S, --stdin-file-list   lees de bestandslijst van standaard invoer

Uitvoerverdeling:
  -o, --output-prefix=PREFIX      maak uitvoerbestanden PREFIX.01 t/m PREFIX.NN
  -l, --whole-size-limit=GROOTTE  verdeel het archief in stukken van hooguit
                                  GROOTTE KB (maar splits de bestanden niet)
  -L, --split-size-limit=GROOTTE  verdeel archief of bestanden in stukken van
                                  hooguit GROOTTE KB
 
Optie -o is nodig bij -l of -L, optie -n is nodig bij -a.
Optie -g impliceert -z, optie -b impliceert -Z.
 %s is waarschijnlijk geen shell-archief %s ziet eruit als een C programma, niet als een shell-archief %s: Illegale ~gebruiker %s: Geen `begin' regel %s: Geen `end' regel %s: Er bestaat geen gebruiker `%s' %s: Geen gewoon bestand %s: Bestand te kort -C is verouderd, gebruik nu -Z Kan geen toegang krijgen tot %s `chdir %s' faalt Kan de naam van het huidige directory niet vinden Kan het bestand %s niet openen Optie -a kan niet zonder -n gebruikt worden De opties -l and -L kunnen niet zonder -n gebruikt worden Sluit `%s' `fork' faalde %d bestand(en) aangemaakt DEBUG niet meevertaald Bestand %s (%s) Vond geen shell opdrachten na `cut' in %s Vond geen shell opdrachten in %s Harde limiet %dk
 In shar: resterende grootte %ld
 Resterende grootte %d
 Verplichte argumenten voor opties in de lange vorm zijn ook nodig
voor de corresponderende korte opties.
 Nieuw bestand, nu nog %ld Geen invoer bestanden Open `%s' Vermijd a.u.b. -X shars op Usenet en op openbare netwerken Leesfout Stel %s (%s) veilig Zachte grens %dk
 Start een `sh' proces Begin met bestand %s
 De `cut' regel werd gevolgd door: %s Teveel directories om aan te maken Probeer `%s --help' voor meer informatie.
 Aanroep: %s [BESTAND]...
 Aanroep: %s [LOKAAL_BESTAND] NIETLOKAAL_BESTAND
 Aanroep: %s [OPTIE]... [BESTAND]...
 LET OP: De `vanilla' mode is niet interactief LET OP: de opties voor opslag van niet-tekst worden genegeerd Schrijffout binair gecomprimeerd leeg gemaakt met gzip standaard invoer tekst 