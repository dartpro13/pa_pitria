<?php


class Action extends CI_Controller{

	function __construct(){
		parent::__construct();
		$this->load->model('m_data');
		$this->load->helper('url');

	}

	function index(){
		$data['user'] = $this->m_data->tampil_data()->result();
		$this->load->view('v_tampil',$data);
	}

	function tambah(){
		$this->load->view('v_input');
	}

	function input_data_penduduk(){
    $nik = $this->input->post('nik');
		$nama = $this->input->post('nama');
    $j_kelamin = $this->input->post('j_kelamin');
    $agama = $this->input->post('agama');
    $tmp_lahir = $this->input->post('tmp_lahir');
    $tgl_lahir = $this->input->post('tgl_lahir');
    $alamat = $this->input->post('alamat');
    $status_perkawinan = $this->input->post('status_perkawinan');
    $kewarganegaraan = $this->input->post('kewarganegaraan');
		$pekerjaan = $this->input->post('pekerjaan');

		$data = array(
      'nik' => $nik,
			'nama' => $nama,
      'j_kelamin' => $j_kelamin,
      'agama' => $agama,
      'tmp_lahir' => $tmp_lahir,
      'tgl_lahir' => $tgl_lahir,
			'alamat' => $alamat,
      'status_perkawinan' => $status_perkawinan,
      'kewarganegaraan' => $kewarganegaraan,
  		'pekerjaan' => $pekerjaan
			);
		$this->m_data->input_data($data,'tb_penduduk');
		redirect('admin/list_data_penduduk');
	}
	function hapus_data_penduduk($id){
		$where = array('nik' => $id);
		$this->m_data->hapus_data($where,'tb_penduduk');
		redirect('admin/list_data_penduduk');
	}
	function update_data_penduduk(){
		$nik = $this->input->post('nik');
		$nama = $this->input->post('nama');
		$j_kelamin = $this->input->post('j_kelamin');
		$agama = $this->input->post('agama');
		$tmp_lahir = $this->input->post('tmp_lahir');
		$tgl_lahir = $this->input->post('tgl_lahir');
		$alamat = $this->input->post('alamat');
		$status_perkawinan = $this->input->post('status_perkawinan');
		$kewarganegaraan = $this->input->post('kewarganegaraan');
		$pekerjaan = $this->input->post('pekerjaan');

		$data = array(

			'nama' => $nama,
			'j_kelamin' => $j_kelamin,
			'agama' => $agama,
			'tmp_lahir' => $tmp_lahir,
			'tgl_lahir' => $tgl_lahir,
			'alamat' => $alamat,
			'status_perkawinan' => $status_perkawinan,
			'kewarganegaraan' => $kewarganegaraan,
			'pekerjaan' => $pekerjaan
			);

	$where = array(
		'nik' => $nik
	);

	$this->m_data->update_data($where,$data,'tb_penduduk');
	redirect('admin/list_data_penduduk');
}
function input_surat_kelahiran(){
	$nomor_surat = $this->input->post('nomor_surat');
	$nama = $this->input->post('nama');
	$tempat_tanggal_lahir = $this->input->post('tempat_tanggal_lahir');
	$jenis_kelamin = $this->input->post('jenis_kelamin');
	$pekerjaan = $this->input->post('pekerjaan');
	$alamat = $this->input->post('alamat');
	$nama_ayah_kandung = $this->input->post('nama_ayah_kandung');
	$nama_ibu_kandung = $this->input->post('nama_ibu_kandung');
	$anak_ke = $this->input->post('anak_ke');

	$data = array(
		'id_surat' => null,
		'nomor_surat' => $nomor_surat,
		'nama' => $nama,
		'tempat_tanggal_lahir' => $tempat_tanggal_lahir,
		'jenis_kelamin' => $jenis_kelamin,
		'pekerjaan' => $pekerjaan,
		'alamat' => $alamat,
		'nama_ayah_kandung' => $nama_ayah_kandung,
		'nama_ibu_kandung' => $nama_ibu_kandung,
		'anak_ke' => $anak_ke,
		'tanggal_pembuatan' => date('Y-m-d'),
		'status' => 'Belum di setujui'
		);
	$this->m_data->input_data($data,'surat_kelahiran');
	redirect('admin/list_surat_kelahiran');
}
function update_surat_kelahiran(){
	$nomor_surat = $this->input->post('nomor_surat');
	$nama = $this->input->post('nama');
	$tempat_tanggal_lahir = $this->input->post('tempat_tanggal_lahir');
	$jenis_kelamin = $this->input->post('jenis_kelamin');
	$pekerjaan = $this->input->post('pekerjaan');
	$alamat = $this->input->post('alamat');
	$nama_ayah_kandung = $this->input->post('nama_ayah_kandung');
	$nama_ibu_kandung = $this->input->post('nama_ibu_kandung');
	$anak_ke = $this->input->post('anak_ke');

	$data = array(
		'nama' => $nama,
		'tempat_tanggal_lahir' => $tempat_tanggal_lahir,
		'jenis_kelamin' => $jenis_kelamin,
		'pekerjaan' => $pekerjaan,
		'alamat' => $alamat,
		'nama_ayah_kandung' => $nama_ayah_kandung,
		'nama_ibu_kandung' => $nama_ibu_kandung,
		'anak_ke' => $anak_ke,
		'tanggal_pembuatan' => date('Y-m-d'),
		);

$where = array(
	'nomor_surat' => $nomor_surat
);

$this->m_data->update_data($where,$data,'surat_kelahiran');
redirect('admin/list_surat_kelahiran');
}
function hapus_surat_kelahiran($id){
	$where = array('id_surat' => $id);
	$this->m_data->hapus_data($where,'surat_kelahiran');
	redirect('admin/list_surat_kelahiran');
}
function approve_surat_kelahiran($id){
	$data = array(
		'status' => 'Di Setujui'
		);

$where = array(
	'id_surat' => $id
);

$this->m_data->update_data($where,$data,'surat_kelahiran');
redirect('lurah/list_surat_kelahiran');
}
}
