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

}
