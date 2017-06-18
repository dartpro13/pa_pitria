<?php
 
class Autocomplete_Model extends CI_Model
{
    public function __construct()
    {
        parent::__construct();
    }
    public function getData($bahasa)
    {
        $this->db->select('nik');
        $this->db->like('nik', $bahasa);
           $query = $this->db->get('tb_penduduk');
        return $query->result();
    }
}