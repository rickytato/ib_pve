cd /tmp
apt-get update
apt-get install pve-headers
apt-get -y install python-libxml2 make dkms
wget http://content.mellanox.com/ofed/MLNX_OFED-4.1-1.0.2.0/MLNX_OFED_LINUX-4.1-1.0.2.0-debian8.7-x86_64.iso
mkdir iso
mount -o loop MLNX_OFED_LINUX-*.iso iso
cd iso/DEBS
dpkg -i ofed-scripts* mlnx-ofed-kernel-utils* mlnx-ofed-kernel-dkms* iser-dkms* srp-dkms* libibverbs1* ibverbs-utils* libibverbs-dev* libibverbs1-dbg* libmlx4-1* libmlx4-dev* libmlx4-1-dbg* libmlx5-1* libmlx5-dev* libmlx5-1-dbg* libibumad* libibumad-static* libibumad-devel* ibacm* ibacm-dev* librdmacm1* librdmacm-utils* librdmacm-dev* libibmad*  ibdump* libibmad-static* libibmad-devel* libopensm* opensm* opensm-doc* libopensm-devel* infiniband-diags_* infiniband-diags-compat* mft* kernel-mft-dkms* srptools* mlnx-ethtool*
update-rc.d -f opensmd remove
sed -i 's/# Default-Start: null/# Default-Start: 2 3 4 5/g' /etc/init.d/opensmd
update-rc.d opensmd defaults
update-rc.d opensmd enable
service openibd start
service opensm start
