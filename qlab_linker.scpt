FasdUAS 1.101.10   ��   ��    k             l      ��  ��   �}
  This script updates the script cues in the Master Happenings Control File and links stop cues to start cues.
  
  To use this script, follow these steps:
  
  1. Edit the variable "MASTER_UID" below to set it to the unique ID of the master QLab project.
  2. Set the "HAPPENINGS_DIRECTORY" variable below to the path of the folder containing the QLab project files.
  3. Select the cues in the QLab workspace that you want to update and link.
  4. Run the script.
  
If any of the selected cues are colored green, the script will try to find the most recently updated QLab project file that has the cue's name and update the script cue with the path to the new file. If multiple files are found with similar names, the script will pick the most recently updated one.

For red stop cues that have a matching start cue, the script will link the stop cue to the start cue.

If the script can't find any of the files it needs, it will display a dialog box with the names of the missing files. If the master QLab project is not detected, the user will receive a notification. If any errors occur during the process, an error dialog will be displayed.
     � 	 	� 
     T h i s   s c r i p t   u p d a t e s   t h e   s c r i p t   c u e s   i n   t h e   M a s t e r   H a p p e n i n g s   C o n t r o l   F i l e   a n d   l i n k s   s t o p   c u e s   t o   s t a r t   c u e s . 
     
     T o   u s e   t h i s   s c r i p t ,   f o l l o w   t h e s e   s t e p s : 
     
     1 .   E d i t   t h e   v a r i a b l e   " M A S T E R _ U I D "   b e l o w   t o   s e t   i t   t o   t h e   u n i q u e   I D   o f   t h e   m a s t e r   Q L a b   p r o j e c t . 
     2 .   S e t   t h e   " H A P P E N I N G S _ D I R E C T O R Y "   v a r i a b l e   b e l o w   t o   t h e   p a t h   o f   t h e   f o l d e r   c o n t a i n i n g   t h e   Q L a b   p r o j e c t   f i l e s . 
     3 .   S e l e c t   t h e   c u e s   i n   t h e   Q L a b   w o r k s p a c e   t h a t   y o u   w a n t   t o   u p d a t e   a n d   l i n k . 
     4 .   R u n   t h e   s c r i p t . 
     
 I f   a n y   o f   t h e   s e l e c t e d   c u e s   a r e   c o l o r e d   g r e e n ,   t h e   s c r i p t   w i l l   t r y   t o   f i n d   t h e   m o s t   r e c e n t l y   u p d a t e d   Q L a b   p r o j e c t   f i l e   t h a t   h a s   t h e   c u e ' s   n a m e   a n d   u p d a t e   t h e   s c r i p t   c u e   w i t h   t h e   p a t h   t o   t h e   n e w   f i l e .   I f   m u l t i p l e   f i l e s   a r e   f o u n d   w i t h   s i m i l a r   n a m e s ,   t h e   s c r i p t   w i l l   p i c k   t h e   m o s t   r e c e n t l y   u p d a t e d   o n e . 
 
 F o r   r e d   s t o p   c u e s   t h a t   h a v e   a   m a t c h i n g   s t a r t   c u e ,   t h e   s c r i p t   w i l l   l i n k   t h e   s t o p   c u e   t o   t h e   s t a r t   c u e . 
 
 I f   t h e   s c r i p t   c a n ' t   f i n d   a n y   o f   t h e   f i l e s   i t   n e e d s ,   i t   w i l l   d i s p l a y   a   d i a l o g   b o x   w i t h   t h e   n a m e s   o f   t h e   m i s s i n g   f i l e s .   I f   t h e   m a s t e r   Q L a b   p r o j e c t   i s   n o t   d e t e c t e d ,   t h e   u s e r   w i l l   r e c e i v e   a   n o t i f i c a t i o n .   I f   a n y   e r r o r s   o c c u r   d u r i n g   t h e   p r o c e s s ,   a n   e r r o r   d i a l o g   w i l l   b e   d i s p l a y e d . 
   
  
 l     ��������  ��  ��        l     ����  r         m        �   H E 7 2 F 4 B 0 B - 0 4 E E - 4 8 4 A - B 5 E 8 - 5 D 7 0 3 4 1 1 A 9 6 2  o      ���� 0 
master_uid 
MASTER_UID��  ��        l    ����  r        m       �   T / U s e r s / a d m i n / D e s k t o p / R E S   -   H A P P E N I N G S   Q L A B  o      ���� ,0 happenings_directory HAPPENINGS_DIRECTORY��  ��        l     ��������  ��  ��        l     ��������  ��  ��        l     ��   !��     : 4 Define a function to replace characters in a string    ! � " " h   D e f i n e   a   f u n c t i o n   t o   r e p l a c e   c h a r a c t e r s   i n   a   s t r i n g   # $ # i      % & % I      �� '���� 0 replace_chars   '  ( ) ( o      ���� 0 	this_text   )  * + * o      ���� 0 search_string   +  ,�� , o      ���� 0 replacement_string  ��  ��   & k       - -  . / . r      0 1 0 l     2���� 2 o     ���� 0 search_string  ��  ��   1 n      3 4 3 1    ��
�� 
txdl 4 1    ��
�� 
ascr /  5 6 5 r     7 8 7 n    	 9 : 9 2    	��
�� 
citm : o    ���� 0 	this_text   8 l      ;���� ; o      ���� 0 	item_list  ��  ��   6  < = < r     > ? > l    @���� @ o    ���� 0 replacement_string  ��  ��   ? n      A B A 1    ��
�� 
txdl B 1    ��
�� 
ascr =  C D C r     E F E c     G H G l    I���� I o    ���� 0 	item_list  ��  ��   H m    ��
�� 
TEXT F o      ���� 0 	this_text   D  J K J r     L M L m     N N � O O   M n      P Q P 1    ��
�� 
txdl Q 1    ��
�� 
ascr K  R�� R L      S S o    ���� 0 	this_text  ��   $  T U T l     ��������  ��  ��   U  V W V l     �� X Y��   X = 7 Start the QLab application and get the front workspace    Y � Z Z n   S t a r t   t h e   Q L a b   a p p l i c a t i o n   a n d   g e t   t h e   f r o n t   w o r k s p a c e W  [ \ [ l  � ]���� ] O   � ^ _ ^ Q   � ` a b ` k   � c c  d e d r     f g f 4   �� h
�� 
qDoc h m    ����  g o      ����  0 frontworkspace frontWorkspace e  i j i l   ��������  ��  ��   j  k l k l   �� m n��   m > 8 Check if the front workspace is the master QLab project    n � o o p   C h e c k   i f   t h e   f r o n t   w o r k s p a c e   i s   t h e   m a s t e r   Q L a b   p r o j e c t l  p q p Z    r s�� t r >    u v u n     w x w 1    ��
�� 
qWID x o    ����  0 frontworkspace frontWorkspace v o    ���� 0 
master_uid 
MASTER_UID s k   " * y y  z { z I  " '�� |��
�� .sysodlogaskr        TEXT | m   " # } } � ~ ~ � M a s t e r   F i l e   n o t   d e t e c t e d !   I s   t h e   U I D   s e t   c o r r e c t l y   i n   t h i s   s c r i p t ?��   {  ��  L   ( *����  ��  ��   t k   - � �  � � � l  - -�� � ���   � $  Get the list of selected cues    � � � � <   G e t   t h e   l i s t   o f   s e l e c t e d   c u e s �  � � � r   - 4 � � � c   - 2 � � � n   - 0 � � � 1   . 0��
�� 
qSEL � o   - .����  0 frontworkspace frontWorkspace � m   0 1��
�� 
list � o      ���� 0 selectedcues selectedCues �  � � � l  5 5��������  ��  ��   �  � � � l  5 5�� � ���   � %  Check if any cues are selected    � � � � >   C h e c k   i f   a n y   c u e s   a r e   s e l e c t e d �  � � � Z   5M � ��� � � =  5 9 � � � o   5 6���� 0 selectedcues selectedCues � J   6 8����   � k   < D � �  � � � I  < A�� ���
�� .sysodlogaskr        TEXT � m   < = � � � � � " N o   c u e s   s e l e c t e d !��   �  ��� � L   B D����  ��  ��   � k   GM � �  � � � l  G G�� � ���   � 6 0 Initialize variable to store missing file names    � � � � `   I n i t i a l i z e   v a r i a b l e   t o   s t o r e   m i s s i n g   f i l e   n a m e s �  � � � r   G N � � � m   G J � � � � �   � o      ���� 0 missingfiles missingFiles �  � � � l  O O�� � ���   � @ : Loop through the selected cues and update the script cues    � � � � t   L o o p   t h r o u g h   t h e   s e l e c t e d   c u e s   a n d   u p d a t e   t h e   s c r i p t   c u e s �  � � � X   O! ��� � � k   c � �  � � � r   c l � � � n   c h � � � 1   d h��
�� 
qCol � o   c d���� 0 	sourcecue 	sourceCue � o      ���� 0 cuecolor cueColor �  ��� � Z   m � ����� � =   m t � � � o   m p���� 0 cuecolor cueColor � m   p s � � � � � 
 g r e e n � k   w � �  � � � r   w � � � � n   w | � � � 1   x |��
�� 
qNam � o   w x���� 0 	sourcecue 	sourceCue � o      ���� 0 cuename cueName �  � � � l  � ���������  ��  ��   �  � � � l  � ��� � ���   � 8 2 Get the most recently modified matching file path    � � � � d   G e t   t h e   m o s t   r e c e n t l y   m o d i f i e d   m a t c h i n g   f i l e   p a t h �  � � � r   � � � � � n  � � � � � I   � ��� ����� 0 replace_chars   �  � � � o   � ����� ,0 happenings_directory HAPPENINGS_DIRECTORY �  � � � m   � � � � � � �    �  ��� � m   � � � � � � �  \  ��  ��   �  f   � � � o      ���� :0 escapedhappenings_directory escapedHAPPENINGS_DIRECTORY �  � � � r   � � � � � I  � ��� ���
�� .sysoexecTEXT���     TEXT � b   � � � � � b   � � � � � b   � � � � � b   � � � � � m   � � � � � � � 
 f i n d   � o   � ����� :0 escapedhappenings_directory escapedHAPPENINGS_DIRECTORY � m   � � � � � � � $   - t y p e   f   - i n a m e   ' * � o   � ����� 0 cuename cueName � m   � � � � � � � Z * . q l a b 4 '   - p r i n t 0   |   x a r g s   - 0   l s   - t p   |   h e a d   - n 1��   � o      ���� 0 newfilepath newFilePath �  � � � l  � ���������  ��  ��   �  � � � l  � ��� � ���   � A ; If a matching file is found, update the script cue content    � � � � v   I f   a   m a t c h i n g   f i l e   i s   f o u n d ,   u p d a t e   t h e   s c r i p t   c u e   c o n t e n t �  ��� � Z   � � �� � =  � � o   � ����� 0 newfilepath newFilePath m   � � �    k   � �  l  � ���	
��  	 + % Append missing file name to variable   
 � J   A p p e n d   m i s s i n g   f i l e   n a m e   t o   v a r i a b l e �� r   � � b   � � b   � � o   � ����� 0 missingfiles missingFiles o   � ����� 0 cuename cueName o   � ���
�� 
ret  o      ���� 0 missingfiles missingFiles��  ��   k   �  l  � �����   + % Convert the POSIX path to a HFS path    � J   C o n v e r t   t h e   P O S I X   p a t h   t o   a   H F S   p a t h  r   � � c   � � l  � ���� 4   � ��~ 
�~ 
psxf  o   � ��}�} 0 newfilepath newFilePath��  �   m   � ��|
�| 
alis o      �{�{ 0 
newhfspath 
newHFSPath !"! l  � ��z�y�x�z  �y  �x  " #$# l  � ��w%&�w  % $  Update the script cue content   & �'' <   U p d a t e   t h e   s c r i p t   c u e   c o n t e n t$ ()( r   � �*+* b   � �,-, b   � �./. b   � �010 b   � �232 b   � �454 b   � �676 m   � �88 �99 R t e l l   a p p l i c a t i o n   i d   " c o m . f i g u r e 5 3 . Q L a b . 4 "7 o   � ��v
�v 
ret 5 l 	 � �:�u�t: m   � �;; �<<      o p e n   "�u  �t  3 o   � ��s�s 0 
newhfspath 
newHFSPath1 m   � �== �>>  "/ o   � ��r
�r 
ret - l 	 � �?�q�p? m   � �@@ �AA  e n d   t e l l�q  �p  + o      �o�o 0 
scripttext 
scriptText) BCB r   �DED o   � ��n�n 0 
scripttext 
scriptTextE n      FGF 1   ��m
�m 
qScSG o   � ��l�l 0 	sourcecue 	sourceCueC H�kH I �jI�i
�j .ascrcmnt****      � ****I b  JKJ b  LML b  NON m  PP �QQ  S e t   s t a r t   c u e  O o  �h�h 0 cuename cueNameM m  RR �SS    t o   d i r e c t o r y  K o  �g�g 0 
newhfspath 
newHFSPath�i  �k  ��  ��  ��  ��  �� 0 	sourcecue 	sourceCue � o   R S�f�f 0 selectedcues selectedCues � TUT l ""�e�d�c�e  �d  �c  U VWV l ""�bXY�b  X F @ Loop through the selected cues and link stop cues to start cues   Y �ZZ �   L o o p   t h r o u g h   t h e   s e l e c t e d   c u e s   a n d   l i n k   s t o p   c u e s   t o   s t a r t   c u e sW [�a[ X  "M\�`]\ k  6H^^ _`_ r  6?aba n  6;cdc 1  7;�_
�_ 
qCold o  67�^�^ 0 stopcue stopCueb o      �]�] 0 	stopcolor 	stopColor` efe Z  @�ghi�\g F  @Ujkj =  @Glml o  @C�[�[ 0 	stopcolor 	stopColorm m  CFnn �oo  r e dk @  JQpqp l JOr�Z�Yr I JO�Xs�W
�X .corecnte****       ****s o  JK�V�V 0 selectedcues selectedCues�W  �Z  �Y  q m  OP�U�U h k  X�tt uvu r  Xawxw n  X]yzy 1  Y]�T
�T 
qNamz o  XY�S�S 0 stopcue stopCuex o      �R�R 0 stopcuename stopCueNamev {�Q{ X  b�|�P}| k  v�~~ � r  v��� n  v{��� 1  w{�O
�O 
qCol� o  vw�N�N 0 opencue openCue� o      �M�M 0 opencuecolor openCueColor� ��� r  ����� n  ����� 1  ���L
�L 
qNam� o  ���K�K 0 opencue openCue� o      �J�J 0 opencuename openCueName� ��� l ���I���I  � @ : If a matching start cue is found, link the stop cue to it   � ��� t   I f   a   m a t c h i n g   s t a r t   c u e   i s   f o u n d ,   l i n k   t h e   s t o p   c u e   t o   i t� ��H� Z  �����G�F� F  ����� =  ����� o  ���E�E 0 opencuecolor openCueColor� m  ���� ��� 
 g r e e n� E  ����� o  ���D�D 0 stopcuename stopCueName� o  ���C�C 0 opencuename openCueName� O  ����� k  ���� ��� l ���B���B  � * $open the workspace and exit the loop   � ��� H o p e n   t h e   w o r k s p a c e   a n d   e x i t   t h e   l o o p� ��� I ���A��@
�A .QLabstrtnull���     obj � o  ���?�? 0 opencue openCue�@  � ��� I ���>��=
�> .sysodelanull��� ��� nmbr� m  ���<�< �=  � ��;�  S  ���;  � o  ���:�:  0 frontworkspace frontWorkspace�G  �F  �H  �P 0 opencue openCue} o  ef�9�9 0 selectedcues selectedCues�Q  i ��� A  ����� l ����8�7� I ���6��5
�6 .corecnte****       ****� o  ���4�4 0 selectedcues selectedCues�5  �8  �7  � m  ���3�3 � ��2� k  ���� ��� I ���1��0
�1 .sysodlogaskr        TEXT� m  ���� ��� � M u s t   s e l e c t   a t   l e a s t   t w o   c u e s   ( b o t h   s t o p   a n d   s t a r t   c u e s )   t o   l i n k   s t o p   c u e s�0  � ��/�  S  ���/  �2  �\  f ��� l ���.�-�,�.  �-  �,  � ��� l ���+���+  � I C Grab the workspace ID of the current stop cue's start counterpart.   � ��� �   G r a b   t h e   w o r k s p a c e   I D   o f   t h e   c u r r e n t   s t o p   c u e ' s   s t a r t   c o u n t e r p a r t .� ��� r  ����� n  ����� 1  ���*
�* 
qWID� 4 ���)�
�) 
qDoc� m  ���(�( � o      �'�' (0 currentworkspaceid currentWorkspaceID� ��&� Z  �H���%�$� > ����� n  ����� 1  ���#
�# 
qWID� o  ���"�"  0 frontworkspace frontWorkspace� n  ����� 1  ���!
�! 
qWID� 4 ��� �
�  
qDoc� m  ���� � k  �D�� ��� I �����
� .coreclosnull���     obj � 4 ����
� 
qDoc� m  ���� � ���
� 
savo� m  ���
� boovfals�  � ��� l ������  � < 6update the script of the stop cue with the correct UID   � ��� l u p d a t e   t h e   s c r i p t   o f   t h e   s t o p   c u e   w i t h   t h e   c o r r e c t   U I D� ��� r  �&��� b  �"��� b  ���� b  ���� b  ���� b  ���� b  ���� b  �
��� b  ���� m  ��� ��� R t e l l   a p p l i c a t i o n   i d   " c o m . f i g u r e 5 3 . Q L a b . 4 "� o  �
� 
ret � l 		���� m  	�� ��� r     s e t   w o r k s p a c e I D   t o   f i r s t   w o r k s p a c e   w h o s e   u n i q u e   i d   i s   "�  �  � o  
�� (0 currentworkspaceid currentWorkspaceID� m  �� ���  "� o  �
� 
ret � l 	���� m  �� ��� D     c l o s e   w o r k s p a c e I D   w i t h o u t   s a v i n g�  �  � o  �
� 
ret � l 	!���� m  !�� ���  e n d   t e l l�  �  � o      �� 0 
scripttext 
scriptText� ��� r  '0� � o  '*�� 0 
scripttext 
scriptText  n       1  +/�
� 
qScS o  *+�
�
 0 stopcue stopCue� �	 I 1D��
� .ascrcmnt****      � **** b  1@ b  1< b  18	
	 m  14 �  S e t   s t o p   c u e  
 o  47�� 0 stopcuename stopCueName m  8; �    t o   U I D   o  <?�� (0 currentworkspaceid currentWorkspaceID�  �	  �%  �$  �&  �` 0 stopcue stopCue] o  %&�� 0 selectedcues selectedCues�a   �  l NN����  �  �    l NN� �    T N If any files could not be found, display a dialog with the missing file names    � �   I f   a n y   f i l e s   c o u l d   n o t   b e   f o u n d ,   d i s p l a y   a   d i a l o g   w i t h   t h e   m i s s i n g   f i l e   n a m e s �� Z  N���� > NU o  NQ���� 0 missingfiles missingFiles m  QT �   k  X{  I Xk�� ��
�� .sysodlogaskr        TEXT  b  Xg!"! b  Xc#$# b  X_%&% m  X['' �(( N T h e   f o l l o w i n g   f i l e s   c o u l d   n o t   b e   f o u n d :& o  [^��
�� 
ret $ o  _b��
�� 
ret " o  cf���� 0 missingfiles missingFiles��   )��) I l{��*��
�� .ascrcmnt****      � ***** b  lw+,+ b  ls-.- m  lo// �00 N T h e   f o l l o w i n g   f i l e s   c o u l d   n o t   b e   f o u n d :. o  or��
�� 
ret , o  sv���� 0 missingfiles missingFiles��  ��  ��  ��  ��   q 1��1 l ����������  ��  ��  ��   a R      ��2��
�� .ascrerr ****      � ****2 o      ���� 0 errmsg errMsg��   b k  ��33 454 l ����67��  6 2 , If an error occurs, display an error dialog   7 �88 X   I f   a n   e r r o r   o c c u r s ,   d i s p l a y   a n   e r r o r   d i a l o g5 9:9 I ����;��
�� .sysodlogaskr        TEXT; o  ������ 0 errmsg errMsg��  : <��< I ����=��
�� .ascrcmnt****      � ****= o  ������ 0 errmsg errMsg��  ��   _ 5    ��>��
�� 
capp> m   
 ?? �@@ & c o m . f i g u r e 5 3 . Q L a b . 4
�� kfrmID  ��  ��   \ A��A l     ��������  ��  ��  ��       ��BCD��  B ������ 0 replace_chars  
�� .aevtoappnull  �   � ****C �� &����EF���� 0 replace_chars  �� ��G�� G  �������� 0 	this_text  �� 0 search_string  �� 0 replacement_string  ��  E ���������� 0 	this_text  �� 0 search_string  �� 0 replacement_string  �� 0 	item_list  F �������� N
�� 
ascr
�� 
txdl
�� 
citm
�� 
TEXT�� !���,FO��-E�O���,FO��&E�O���,FO�D ��H����IJ��
�� .aevtoappnull  �   � ****H k    �KK  LL  MM  [����  ��  ��  I ���������� 0 	sourcecue 	sourceCue�� 0 stopcue stopCue�� 0 opencue openCue�� 0 errmsg errMsgJ K �� ����?�������� }�������� � ������������� ����� � ����� � � �������������8;=@����PR����n���������������������������'/������ 0 
master_uid 
MASTER_UID�� ,0 happenings_directory HAPPENINGS_DIRECTORY
�� 
capp
�� kfrmID  
�� 
qDoc��  0 frontworkspace frontWorkspace
�� 
qWID
�� .sysodlogaskr        TEXT
�� 
qSEL
�� 
list�� 0 selectedcues selectedCues�� 0 missingfiles missingFiles
�� 
kocl
�� 
cobj
�� .corecnte****       ****
�� 
qCol�� 0 cuecolor cueColor
�� 
qNam�� 0 cuename cueName�� 0 replace_chars  �� :0 escapedhappenings_directory escapedHAPPENINGS_DIRECTORY
�� .sysoexecTEXT���     TEXT�� 0 newfilepath newFilePath
�� 
ret 
�� 
psxf
�� 
alis�� 0 
newhfspath 
newHFSPath�� 0 
scripttext 
scriptText
�� 
qScS
�� .ascrcmnt****      � ****�� 0 	stopcolor 	stopColor
�� 
bool�� 0 stopcuename stopCueName�� 0 opencuecolor openCueColor�� 0 opencuename openCueName
�� .QLabstrtnull���     obj �� 
�� .sysodelanull��� ��� nmbr�� (0 currentworkspaceid currentWorkspaceID
�� 
savo
�� .coreclosnull���     obj �� 0 errmsg errMsg��  ����E�O�E�O)���0�s*�k/E�O��,� �j OhYT��,�&E�O�jv  �j OhYa E` O ��[a a l kh  �a ,E` O_ a   ��a ,E` O)�a a m+ E` Oa _ %a %_ %a  %j !E` "O_ "a #  _ _ %_ $%E` Y P*a %_ "/a &&E` 'Oa (_ $%a )%_ '%a *%_ $%a +%E` ,O_ ,�a -,FOa ._ %a /%_ '%j 0Y h[OY�AO*�[a a l kh �a ,E` 1O_ 1a 2 	 �j la 3& l�a ,E` 4O \�[a a l kh �a ,E` 5O�a ,E` 6O_ 5a 7 	 _ 4_ 6a 3& � �j 8Oa 9j :OUY h[OY��Y �j l a ;j OY hO*�k/�,E` <O��,*�k/�, W*�k/a =fl >Oa ?_ $%a @%_ <%a A%_ $%a B%_ $%a C%E` ,O_ ,�a -,FOa D_ 4%a E%_ <%j 0Y h[OY��O_ a F (a G_ $%_ $%_ %j Oa H_ $%_ %j 0Y hOPW X I J�j O�j 0U ascr  ��ޭ