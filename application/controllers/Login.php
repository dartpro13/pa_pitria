<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Login extends CI_Controller{

	public function __construct(){
		parent::__construct();
		//load Login_model.php	
		$this->load->model('login_model');
		//check the username is already set up or not
		if ($this->session->userdata('username')) {
			//if username is already set up, then check the level of username is admin or member
			if($this->session->userdata('level') == 'admin'){
				redirect('admin/');
			}elseif($this->session->userdata('level') == 'lurah'){
				redirect('lurah/');
			}
//            elseif($this->session->userdata('level') == 'camat'){
//				redirect('camat/');
//			}
		}
	}

	public function index(){
		$data = array('error' => ''
					);
		$data['title']='Login';
		$data['assets']=base_url().'assets/login/';
                $data['img']=base_url().'assets/images/';
                $this->load->view('login/index',$data);
	}

	//function for processing login form
	public function login_process(){
		$username = $this->input->post('username');
		$password = md5($this->input->post('password'));
        $pwd=$this->input->post('password');
					//calling chech_user() function in Login_model.php
		$result = $this->login_model->check_user($username, $password); 

		if($result->num_rows() > 0){
			foreach ($result->result() as $row) {
				$id = $row->id;
				$username = $row->username;
				$email = $row->email;
				$nama_lengkap = $row->nama_lengkap;
				$level = $row->level;
				$last_update = $row->last_update;
				$foto = $row->foto;
			}

			$newdata = array(
			        'id'  => $id,
			        'username' => $username,
//			        'nama_lengkap' => $nama_lengkap,
			        'last_update' => $last_update,
//			        'password' => $pwd,
//			        'email' => $email,
//			        'foto' => $foto,
			        'level' => $level,
			        'logged_in' => TRUE
			);
			
			//set up session data
			$this->session->set_userdata($newdata);
			if($this->session->userdata('level')=='admin') {
				redirect('admin/');
			}elseif($this->session->userdata('level') == 'lurah'){
				redirect('lurah/');
			}else{
                redirect('login/');
            }
//            elseif($this->session->userdata('level') == 'camat'){
//				redirect('camat/');
//			}
		}
	}

	public function register(){
		$data = array('error' => ''
					);
		$this->load->view('form_register', $data);
	}
}