<?php


class Action extends CI_Controller{

	function __construct(){
		parent::__construct();
		$this->load->model('m_data');
		$this->load->helper('url');
		$this->load->helper("file");
		$this->load->library(array('PHPExcel','PHPExcel/IOFactory'));
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
    }
function hapus_notif($id){
		$data = array(
            'status' => '1'
			);

	$where = array(
		'id' => $id
	);

	$this->m_data->update_data($where,$data,'notification');
    $notif = $this->m_data->edit_data($where,'notification')->result();
    $active = $this->session->userdata('level');
    foreach($notif as $not){}
	redirect($active.'/'.$not->redirect);
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
    function input_surat_keterangan_pindah(){
	$nomor_kartu_keluarga = $this->input->post('nomor_kartu_keluarga');
	$nama_kepala_keluarga = $this->input->post('nama_kepala_keluarga');
	$alamat_asal = $this->input->post('alamat_asal');
	$rt_asal = $this->input->post('rt_asal');
	$rw_asal = $this->input->post('rw_asal');
	$dusun_asal = $this->input->post('dusun_asal');
	$nik_pemohon = $this->input->post('nik_pemohon');
	$nama_lengkap = $this->input->post('nama_lengkap');
	$alasan_pindah = $this->input->post('alasan_pindah');
	$alamat_tujuan = $this->input->post('alamat)tujuan');
	$rt_tujuan = $this->input->post('rt_tujuan');
	$rw_tujuan = $this->input->post('rw_tujuan');
	$dusun_tujuan = $this->input->post('dusun_tujuan');
	$desa_tujuan = $this->input->post('desa_tujuan');
	$kecamatan_tujuan = $this->input->post('kecamatan_tujuan');
	$kabupaten_tujuan = $this->input->post('kabupaten_tujuan');
	$provinsi_tujuan = $this->input->post('provinsi_tujuan');
    $jenis_kepindahan = $this->input->post('jenis_kepindahan');
	$status_kk_yang_tidak_pindah = $this->input->post('status_kk_yang_tidak_pindah');
	$status_kk_yang_pindah = $this->input->post('status_kk_yang_pindah');
	$nik_keluarga_yang_pindah = $this->input->post('nik_keluarga_yang_pindah');
	$nama_keluarga_yang_pindah = $this->input->post('nama_keluarga_yang_pindah');
	$masa_berlaku_ktp = $this->input->post('masa_berlaku_ktp');
	$shdk = $this->input->post('shdk');
	
	$data = array(
		'id_surat' => null,
		'nomor_kartu_keluarga'=>$nomor_kartu_keluarga,
        'nama_kepala_keluarga'=>$nama_kepala_keluarga,
        'alamat_asal'=>$alamat_asal,
        'rt_asal'=>$rt_asal,
        'rw_asal'=>$rw_asal,
        'dusun_asal'=>$dusun_asal,
        'nik_pemohon'=>$nik_pemohon,
        'nama_lengkap'=>$nama_lengkap,
        'alasan_pindah'=>$alasan_pindah,
        'alamat_tujuan'=>$alamat_tujuan,
        'rt_tujuan'=>$rt_tujuan,
        'rw_tujuan'=>$rw_tujuan,
        'dusun_tujuan'=>$dusun_tujuan,
        'desa_tujuan'=>$desa_tujuan,
        'kecamatan_tujuan'=>$kecamatan_tujuan,
        'kabupaten_tujuan'=>$kabupaten_tujuan,
        'provinsi_tujuan'=>$provinsi_tujuan,
        'jenis_kepindahan'=>$jenis_kepindahan,
        'status_kk_yang_tidak_pindah'=>$status_kk_yang_tidak_pindah,
        'status_kk_yang_pindah'=>$status_kk_yang_pindah,
        'nik_keluarga_yang_pindah'=>$nik_keluarga_yang_pindah,
        'nama_keluarga_yang_pindah'=>$nama_keluarga_yang_pindah,
    	'masa_berlaku_ktp'=>$masa_berlaku_ktp,
        'shdk'=>$shdk,
        'tanggal_pembuatan' => date('Y-m-d'),
		'status' => 'Belum di setujui'
		);
	$this->m_data->input_data($data,'surat_keterangan_pindah');
	redirect('admin/list_surat_keterangan_pindah');
}
    function update_surat_keterangan_pindah(){
        $id_surat = $this->input->post('id_surat');
        $nama_kepala_keluarga = $this->input->post('nama_kepala_keluarga');
        $alamat_asal = $this->input->post('alamat_asal');
        $rt_asal = $this->input->post('rt_asal');
        $rw_asal = $this->input->post('rw_asal');
        $dusun_asal = $this->input->post('dusun_asal');
        $nik_pemohon = $this->input->post('nik_pemohon');
        $nama_lengkap = $this->input->post('nama_lengkap');
        $alasan_pindah = $this->input->post('alasan_pindah');
        $alamat_tujuan = $this->input->post('alamat)tujuan');
        $rt_tujuan = $this->input->post('rt_tujuan');
        $rw_tujuan = $this->input->post('rw_tujuan');
        $dusun_tujuan = $this->input->post('dusun_tujuan');
        $desa_tujuan = $this->input->post('desa_tujuan');
        $kecamatan_tujuan = $this->input->post('kecamatan_tujuan');
        $kabupaten_tujuan = $this->input->post('kabupaten_tujuan');
        $provinsi_tujuan = $this->input->post('provinsi_tujuan');
        $jenis_kepindahan = $this->input->post('jenis_kepindahan');
        $status_kk_yang_tidak_pindah = $this->input->post('status_kk_yang_tidak_pindah');
        $status_kk_yang_pindah = $this->input->post('status_kk_yang_pindah');
        $nik_keluarga_yang_pindah = $this->input->post('nik_keluarga_yang_pindah');
        $nama_keluarga_yang_pindah = $this->input->post('nama_keluarga_yang_pindah');
        $masa_berlaku_ktp = $this->input->post('masa_berlaku_ktp');
        $shdk = $this->input->post('shdk');

        $data = array(
        'nomor_kartu_keluarga'=>$nomor_kartu_keluarga,
        'nama_kepala_keluarga'=>$nama_kepala_keluarga,
        'alamat_asal'=>$alamat_asal,
        'rt_asal'=>$rt_asal,
        'rw_asal'=>$rw_asal,
        'dusun_asal'=>$dusun_asal,
        'nik_pemohon'=>$nik_pemohon,
        'nama_lengkap'=>$nama_lengkap,
        'alasan_pindah'=>$alasan_pindah,
        'alamat_tujuan'=>$alamat_tujuan,
        'rt_tujuan'=>$rt_tujuan,
        'rw_tujuan'=>$rw_tujuan,
        'dusun_tujuan'=>$dusun_tujuan,
        'desa_tujuan'=>$desa_tujuan,
        'kecamatan_tujuan'=>$kecamatan_tujuan,
        'kabupaten_tujuan'=>$kabupaten_tujuan,
        'provinsi_tujuan'=>$provinsi_tujuan,
        'jenis_kepindahan'=>$jenis_kepindahan,
        'status_kk_yang_tidak_pindah'=>$status_kk_yang_tidak_pindah,
        'status_kk_yang_pindah'=>$status_kk_yang_pindah,
        'nik_keluarga_yang_pindah'=>$nik_keluarga_yang_pindah,
        'nama_keluarga_yang_pindah'=>$nama_keluarga_yang_pindah,
    	'masa_berlaku_ktp'=>$masa_berlaku_ktp,
        'shdk'=>$shdk,
        'tanggal_pembuatan' => date('Y-m-d'),
		'status' => 'Belum di setujui'
            );

$where = array(
	'id_surat' => $id_surat
);

$this->m_data->update_data($where,$data,'surat_keterangan_pindah');
redirect('admin/list_surat_keterangan_pindah');
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
function hapus_surat_kematian($id){
	$where = array('id_surat' => $id);
	$this->m_data->hapus_data($where,'surat_kematian');
	redirect('admin/list_surat_kematian');
}
    function hapus_surat_keterangan_pindah($id){
	$where = array('id_surat' => $id);
	$this->m_data->hapus_data($where,'surat_keterangan_pindah');
	redirect('admin/list_surat_keterangan_pindah');
}
    function hapus_surat_keterangan_ktp($id){
	$where = array('id_surat' => $id);
	$this->m_data->hapus_data($where,'surat_keterangan_ktp');
	redirect('admin/list_surat_keterangan_ktp');
}
    function hapus_surat_keterangan_kk($id){
	$where = array('id_surat' => $id);
	$this->m_data->hapus_data($where,'surat_keterangan_kk');
	redirect('admin/list_surat_keterangan_kk');
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
    function not_approve_surat_kelahiran($id){
	$data = array(
		'status' => 'Belum Di Setujui'
		);

$where = array(
	'id_surat' => $id
);

$this->m_data->update_data($where,$data,'surat_kelahiran');
redirect('lurah/list_surat_kelahiran');
}
    function approve_surat_keterangan_pindah($id){
	$data = array(
		'status' => 'Di Setujui'
		);

$where = array(
	'id_surat' => $id
);

$this->m_data->update_data($where,$data,'surat_keterangan_pindah');
redirect('lurah/list_surat_keterangan_pindah');
}
    function not_approve_surat_keterangan_pindah($id){
	$data = array(
		'status' => 'Belum Di Setujui'
		);

$where = array(
	'id_surat' => $id
);

$this->m_data->update_data($where,$data,'surat_keterangan_pindah');
redirect('lurah/list_surat_keterangan_pindah');
}
    function not_approve_surat_kematian($id){
	$data = array(
		'status' => 'Belum Di Setujui'
		);

$where = array(
	'id_surat' => $id
);

$this->m_data->update_data($where,$data,'surat_kematian');
redirect('lurah/list_surat_kematian');
}
    function not_approve_surat_keterangan_kk($id){
	$data = array(
		'status' => 'Belum Di Setujui'
		);

$where = array(
	'id_surat' => $id
);

$this->m_data->update_data($where,$data,'surat_keterangan_kk');
redirect('lurah/list_surat_keterangan_kk');
}
    function not_approve_surat_keterangan_ktp($id){
	$data = array(
		'status' => 'Belum Di Setujui'
		);

$where = array(
	'id_surat' => $id
);

$this->m_data->update_data($where,$data,'surat_keterangan_ktp');
redirect('lurah/list_surat_keterangan_ktp');
}
function import_from_excel_data_penduduk(){
	$fileNam = time().$_FILES['file']['name'];
    $fileName = str_replace(" ", "_", $fileNam);
	        $config['upload_path'] = './assets/'; //buat folder dengan nama assets di root folder
	        $config['file_name'] = $fileName;
	        $config['allowed_types'] = 'xls|xlsx|csv';
	        $config['max_size'] = 10000;

	        $this->load->library('upload');
	        $this->upload->initialize($config);

	        if(! $this->upload->do_upload('file') )
	        $this->upload->display_errors();

	        $media = $this->upload->data('file');
	        $inputFileName = 'assets/'.$config['file_name'];

	        try {
	                $inputFileType = IOFactory::identify($inputFileName);
	                $objReader = IOFactory::createReader($inputFileType);
	                $objPHPExcel = $objReader->load($inputFileName);
	            } catch(Exception $e) {
	                die('Error loading file "'.pathinfo($inputFileName,PATHINFO_BASENAME).'": '.$e->getMessage());
	            }

	            $sheet = $objPHPExcel->getSheet(0);
	            $highestRow = $sheet->getHighestRow();
	            $highestColumn = $sheet->getHighestColumn();

	            for ($row = 2; $row <= $highestRow; $row++){                  //  Read a row of data into an array
	                $rowData = $sheet->rangeToArray('A' . $row . ':' . $highestColumn . $row,
	                                                NULL,
	                                                TRUE,
	                                                FALSE);

	                //Sesuaikan sama nama kolom tabel di database
	                 $data = array(
                         "rw"=> $rowData[0][0],
                         "rt"=> $rowData[0][1],
                         "dusun"=> $rowData[0][2],
                         "alamat"=> $rowData[0][3],
                         "kode_kelurahan"=> $rowData[0][4],
                         "nama_kepala_keluarga"=> $rowData[0][5],
                         "nik"=> $rowData[0][7],
                         "nama"=> $rowData[0][8],
                         "j_kelamin"=> $rowData[0][9],
                         "hubungan"=> $rowData[0][10],
                         "tmp_lahir"=> $rowData[0][11],
                         "tgl_lahir"=> $rowData[0][12],
                         "usia"=> $rowData[0][13],
                         "status_perkawinan"=> $rowData[0][14],
                         "agama"=> $rowData[0][15],
                         "gol_darah"=> $rowData[0][16],
                         "kewarganegaraan"=> $rowData[0][17],
                         "etnis_suku"=> $rowData[0][18],
                         "pendidikan"=> $rowData[0][19],
                         "pekerjaan"=> $rowData[0][20]
	                );

	                //sesuaikan nama dengan nama tabel
	                $insert = $this->db->insert("tb_penduduk",$data);
	                delete_files($media['file_path']);

	            }
	        redirect('admin/list_data_penduduk');
}
function input_surat_kematian(){
	$nomor_surat = $this->input->post('nomor_surat');
	$terlapor_nama = $this->input->post('terlapor_nama');
	$terlapor_jenis_kelamin = $this->input->post('terlapor_jenis_kelamin');
	$terlapor_tanggal_lahir = $this->input->post('terlapor_tanggal_lahir');
	$terlapor_agama = $this->input->post('terlapor_agama');
	$terlapor_alamat = $this->input->post('terlapor_alamat');
	$meninggal_hari = $this->input->post('meninggal_hari');
	$meninggal_tanggal = $this->input->post('meninggal_tanggal');
	$meninggal_pukul = $this->input->post('meninggal_pukul');
	$meninggal_tempat = $this->input->post('meninggal_tempat');
	$meninggal_penyebab = $this->input->post('meninggal_penyebab');
	$pelapor_nama = $this->input->post('pelapor_nama');
	$pelapor_nik = $this->input->post('pelapor_nik');
	$pelapor_tanggal_lahir = $this->input->post('pelapor_tanggal_lahir');
	$pelapor_pekerjaan = $this->input->post('pelapor_pekerjaan');
	$pelapor_alamat = $this->input->post('pelapor_alamat');

	$data = array(
		'id_surat' => null,
		'nomor_surat' => $nomor_surat,
		'terlapor_nama' => $terlapor_nama,
		'terlapor_jenis_kelamin' => $terlapor_jenis_kelamin,
		'terlapor_tanggal_lahir' => $terlapor_tanggal_lahir,
		'terlapor_agama' => $terlapor_agama,
		'terlapor_alamat' => $terlapor_alamat,
		'meninggal_hari' => $meninggal_hari,
		'meninggal_tanggal' => $meninggal_tanggal,
		'meninggal_pukul' => $meninggal_pukul,
		'meninggal_tempat' => $meninggal_tempat,
		'meninggal_penyebab' => $meninggal_penyebab,
		'pelapor_nama' => $pelapor_nama,
		'pelapor_nik' => $pelapor_nik,
		'pelapor_tanggal_lahir' => $pelapor_tanggal_lahir,
		'pelapor_pekerjaan' => $pelapor_pekerjaan,
		'pelapor_alamat' => $pelapor_alamat,
		'tanggal_pembuatan' => date('Y-m-d'),
		'status' => 'Belum di setujui'
		);
	$this->m_data->input_data($data,'surat_kematian');
	redirect('admin/list_surat_kematian');
}
function update_surat_kematian(){
	$nomor_surat = $this->input->post('nomor_surat');
	$terlapor_nama = $this->input->post('terlapor_nama');
	$terlapor_jenis_kelamin = $this->input->post('terlapor_jenis_kelamin');
	$terlapor_tanggal_lahir = $this->input->post('terlapor_tanggal_lahir');
	$terlapor_agama = $this->input->post('terlapor_agama');
	$terlapor_alamat = $this->input->post('terlapor_alamat');
	$meninggal_hari = $this->input->post('meninggal_hari');
	$meninggal_tanggal = $this->input->post('meninggal_tanggal');
	$meninggal_pukul = $this->input->post('meninggal_pukul');
	$meninggal_tempat = $this->input->post('meninggal_tempat');
	$meninggal_penyebab = $this->input->post('meninggal_penyebab');
	$pelapor_nama = $this->input->post('pelapor_nama');
	$pelapor_nik = $this->input->post('pelapor_nik');
	$pelapor_tanggal_lahir = $this->input->post('pelapor_tanggal_lahir');
	$pelapor_pekerjaan = $this->input->post('pelapor_pekerjaan');
	$pelapor_alamat = $this->input->post('pelapor_alamat');

	$data = array(
		'terlapor_nama' => $terlapor_nama,
		'terlapor_jenis_kelamin' => $terlapor_jenis_kelamin,
		'terlapor_tanggal_lahir' => $terlapor_tanggal_lahir,
		'terlapor_agama' => $terlapor_agama,
		'terlapor_alamat' => $terlapor_alamat,
		'meninggal_hari' => $meninggal_hari,
		'meninggal_tanggal' => $meninggal_tanggal,
		'meninggal_pukul' => $meninggal_pukul,
		'meninggal_tempat' => $meninggal_tempat,
		'meninggal_penyebab' => $meninggal_penyebab,
		'pelapor_nama' => $pelapor_nama,
		'pelapor_nik' => $pelapor_nik,
		'pelapor_tanggal_lahir' => $pelapor_tanggal_lahir,
		'pelapor_pekerjaan' => $pelapor_pekerjaan,
		'pelapor_alamat' => $pelapor_alamat,
		'tanggal_pembuatan' => date('Y-m-d'),
		);

$where = array(
	'nomor_surat' => $nomor_surat
);

$this->m_data->update_data($where,$data,'surat_kematian');
redirect('admin/list_surat_kematian');
}
function approve_surat_kematian($id){
	$data = array(
		'status' => 'Di Setujui'
		);

$where = array(
	'id_surat' => $id
);

$this->m_data->update_data($where,$data,'surat_kematian');
redirect('lurah/list_surat_kematian');
}
///////////////////////////////////////////////////////////////
    
    function input_surat_keterangan_ktp(){
        $nama_lengkap = $this->input->post('nama_lengkap');
        $jenis_kelamin = $this->input->post('jenis_kelamin');
        $tempat_tanggal_lahir = $this->input->post('tempat_tanggal_lahir');
        $bangsa_agama = $this->input->post('bangsa_agama');
        $pekerjaan = $this->input->post('pekerjaan');
        $alamat = $this->input->post('alamat');
	$data = array(
		'id_surat' => null,
		'nama_lengkap' => $nama_lengkap,
		'jenis_kelamin' => $jenis_kelamin,
		'tempat_tanggal_lahir' => $tempat_tanggal_lahir,
		'bangsa_agama' => $bangsa_agama,
		'pekerjaan' => $pekerjaan,
		'alamat' => $alamat,
		'tanggal' => date('Y-m-d'),
		'status' => 'Belum di setujui'
		);
	$this->m_data->input_data($data,'surat_keterangan_ktp');
	redirect('admin/list_surat_keterangan_ktp');
    }
    function update_surat_keterangan_ktp(){
        $id_surat = $this->input->post('id_surat');
        $nama_lengkap = $this->input->post('nama_lengkap');
        $jenis_kelamin = $this->input->post('jenis_kelamin');
        $tempat_tanggal_lahir = $this->input->post('tempat_tanggal_lahir');
        $bangsa_agama = $this->input->post('bangsa_agama');
        $pekerjaan = $this->input->post('pekerjaan');
        $alamat = $this->input->post('alamat');

        $data = array(
        'nama_lengkap' => $nama_lengkap,
		'jenis_kelamin' => $jenis_kelamin,
		'tempat_tanggal_lahir' => $tempat_tanggal_lahir,
		'bangsa_agama' => $bangsa_agama,
		'pekerjaan' => $pekerjaan,
		'alamat' => $alamat,
		'tanggal' => date('Y-m-d'),
		'status' => 'Belum di setujui'
            );

$where = array(
	'id_surat' => $id_surat
);

$this->m_data->update_data($where,$data,'surat_keterangan_ktp');
redirect('admin/list_surat_keterangan_ktp');
}
function approve_surat_keterangan_ktp($id){
	$data = array(
		'status' => 'Di Setujui'
		);

$where = array(
	'id_surat' => $id
);

$this->m_data->update_data($where,$data,'surat_keterangan_ktp');
redirect('lurah/list_surat_keterangan_ktp');
}
    /////////////////////////////////////////////////////////////////////////////
function input_surat_keterangan_kk(){
        $nama_lengkap = $this->input->post('nama_lengkap');
        $jenis_kelamin = $this->input->post('jenis_kelamin');
        $tempat_tanggal_lahir = $this->input->post('tempat_tanggal_lahir');
        $bangsa_agama = $this->input->post('bangsa_agama');
        $pekerjaan = $this->input->post('pekerjaan');
        $alamat = $this->input->post('alamat');
	$data = array(
		'id_surat' => null,
		'nama_lengkap' => $nama_lengkap,
		'jenis_kelamin' => $jenis_kelamin,
		'tempat_tanggal_lahir' => $tempat_tanggal_lahir,
		'bangsa_agama' => $bangsa_agama,
		'pekerjaan' => $pekerjaan,
		'alamat' => $alamat,
		'tanggal' => date('Y-m-d'),
		'status' => 'Belum di setujui'
		);
	$this->m_data->input_data($data,'surat_keterangan_kk');
	redirect('admin/list_surat_keterangan_kk');
    }
    function update_surat_keterangan_kk(){
        $id_surat = $this->input->post('id_surat');
        $nama_lengkap = $this->input->post('nama_lengkap');
        $jenis_kelamin = $this->input->post('jenis_kelamin');
        $tempat_tanggal_lahir = $this->input->post('tempat_tanggal_lahir');
        $bangsa_agama = $this->input->post('bangsa_agama');
        $pekerjaan = $this->input->post('pekerjaan');
        $alamat = $this->input->post('alamat');

        $data = array(
        'nama_lengkap' => $nama_lengkap,
		'jenis_kelamin' => $jenis_kelamin,
		'tempat_tanggal_lahir' => $tempat_tanggal_lahir,
		'bangsa_agama' => $bangsa_agama,
		'pekerjaan' => $pekerjaan,
		'alamat' => $alamat,
		'tanggal' => date('Y-m-d'),
		'status' => 'Belum di setujui'
            );

$where = array(
	'id_surat' => $id_surat
);

$this->m_data->update_data($where,$data,'surat_keterangan_kk');
redirect('admin/list_surat_keterangan_kk');
}
    function edit_profile(){
        $username_old = $this->input->post('username-old');
        $username = $this->input->post('username');
        $password = $this->input->post('password');
        $level = $this->input->post('level');

        $data = array(
        'username' => $username,
		'password' => md5($password),
		'last_update' => date('SYSDATE()'),
		'level' => $level
            );

$where = array(
	'username' => $username_old
);

$this->m_data->update_data($where,$data,'user');
        $this->session->set_userdata($data);
redirect('admin/');
}
function approve_surat_keterangan_kk($id){
	$data = array(
		'status' => 'Di Setujui'
		);

$where = array(
	'id_surat' => $id
);

$this->m_data->update_data($where,$data,'surat_keterangan_kk');
redirect('lurah/list_surat_keterangan_kk');
}
}
