Ubuntuÿ����ʿ-Ubuntu Oneϵͳ�رգ�����л���Dropbox����Box�Ʒ���
Canonical��˾�����ر�Ubuntu One���Ʒ������������Ѱ�ұ��������������������������������кܶ��Ʒ�����ṩ�̣����ǽ���С����֧��linux,����Ubuntu��
Dropboxȫ��֧��Ubuntu������һ���ܺõ�������ubuntu����ϵͳ������֪ͨ���Ŀͻ��ˡ�Box���ٷ���Box.netҲ����ͨ��WebDavЭ��֧��linux��
������һ������Canonical��˾����Ubuntu One��ժ¼��
As of today (April 2), it will no longer be possible to purchase storage or music from the Ubuntu One store. The Ubuntu One file services will not be included in the upcoming Ubuntu 14.04 LTS release, and the Ubuntu One apps in older version of Ubuntu and in the Ubuntu, Google and Apple stores will be updated appropriately.
Ҳ����˵������ubuntu��ʧȥ���������õķ�����һ���棬����������ƶ���һ�����ȶ������������������ṩ����һ���ȽϺõ�ѡ��
�����Ҫ��˵��һ��������ubuntu������DropBox����Box�Ʒ���

��ubuntu�а�װDropBox����
����������������Ѿ�д�˺ܶ࣬Ϊ����ubuntu�а�װDropBox���̣�����Ҫ�������²���ȥ���������ṩ��һ����ubuntu��һ������װ��ʹ��DropBox�Ĳ��衣
�鿴�������裬�����������������ӣ�
http://www.liberiangeek.net/2013/03/how-to-install-dropbox-in-ubuntu-13-04-raring-ringtail/

��Ubuntu��ʹ��Box����
�Դ�Box�����ṩ��linuxһ��ȫ���ܵĿͻ��ˣ�����ubuntu�������ʹ��WebDavЭ�������ʺʹ洢���˻��Ķ�����
��Ctrl �C Alt �C T�����նˣ��ն˱��򿪺�ִ���������������װ����
sudo apt-get install davfs2
��������ִ�����������������davfs2��ѡ��Yes������û��Ȩ�޵��û�������WebDav��Դ��
sudo dpkg-reconfigure davfs2
������ͨ��ִ������������davfs2Ŀ¼���Ƶ����homeĿ¼��
sudo cp -r /etc/davfs2/ $HOME/.davfs2
Ȼ��ִ�����������ȡ�ļ��е�����Ȩ��
sudo chown -R username $HOME/.davfs2/
������û�������username 
�������������ļ�������ĵ�¼ƾ֤��
gedit ~/.davfs2/secrets
Ȼ���������û�����email��ַ�������룬���ļ�ĩβ���������в����档
https://dav.box.com/dav richard@liberiangeek.net  <box_password>
������˻���Ϣ�滻�����email��ַ��password��
������������������������˻���davfs2���У�
sudo adduser <username> davfs2
Ȼ����sudo gedit /etc/fstab ��/etc/fstab�ں����������һ�в����棺
https://dav.box.com/dav/ /home/<username>/box  davfs _netdev,rw,user 0 0 
��󴴽�һ�����ص㲢����Box
mkdir ~/box
������ĵ��ԣ�Box�ܿ����Զ������ˣ�
�����°ɣ�