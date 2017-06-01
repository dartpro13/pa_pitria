<?php

class M_data extends CI_Model{
	function tampil_data_penduduk(){
		return $this->db->get('tb_penduduk');
	}
    function hitung_data($table){
        return $this->db->count_all($table);
    }
    function hitung_data_laki(){
        $this->db->like('j_kelamin', 'laki-laki');
        $this->db->from('tb_penduduk');
        return $this->db->count_all_results();
    }
    function hitung_data_wanita(){
        $this->db->like('j_kelamin', 'perempuan');
        $this->db->from('tb_penduduk');
        return $this->db->count_all_results();
    }
    function hitung_data_notif_admin(){
        $this->db->like('untuk', 'Admin');
        $this->db->like('status', '0');
        $this->db->from('notification');
        return $this->db->count_all_results();
    }
    function hitung_data_notif_lurah(){
        $this->db->like('untuk', 'Lurah');
        $this->db->like('status', '0');
        $this->db->from('notification');
        return $this->db->count_all_results();
    }
	function tampil_data_surat_kelahiran(){
		return $this->db->get('surat_kelahiran');
	}
    function tampil_data_surat_keterangan_pindah(){
		return $this->db->get('surat_keterangan_pindah');
	}
    function tampil_data_surat_keterangan_ktp(){
		return $this->db->get('surat_keterangan_ktp');
	}
    function tampil_data_surat_keterangan_kk(){
		return $this->db->get('surat_keterangan_kk');
	}
	function tampil_data_surat_kematian(){
		return $this->db->get('surat_kematian');
	}

	function input_data($data,$table){
		$this->db->insert($table,$data);
	}
	function hapus_data($where,$table){
		$this->db->where($where);
		$this->db->delete($table);
	}
	function edit_data($where,$table){
	return $this->db->get_where($table,$where);
	}
	function update_data($where,$data,$table){
		$this->db->where($where);
		$this->db->update($table,$data);
	}
}
