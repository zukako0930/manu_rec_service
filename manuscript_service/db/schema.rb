# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180227062159) do

  create_table "manuscripts", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC" do |t|
    t.date "f_date"
    t.integer "f_job_no"
    t.datetime "f_rec_dt"
    t.integer "f_job_history_no"
    t.integer "f_pub_no"
    t.integer "f_pub_frame_no"
    t.integer "f_pub_sub_no"
    t.datetime "f_org_pub_st_dt"
    t.datetime "f_org_pub_ed_dt"
    t.integer "f_pub_baitoru_pub_flg"
    t.integer "f_pub_exclusive_page_pub_flg"
    t.integer "f_pub_prior_type"
    t.text "f_pub_prior_name"
    t.integer "f_offer_dtl_no"
    t.integer "f_comp_no"
    t.text "f_comp_name"
    t.integer "f_base_no"
    t.text "f_base_id"
    t.text "f_base_name"
    t.text "f_base_disp_tanto_name"
    t.text "f_base_tel"
    t.text "f_base_fd_tel"
    t.text "f_base_fax"
    t.text "f_base_entry_way_text"
    t.time "f_base_tel_taio_st_time"
    t.time "f_base_tel_taio_ed_time"
    t.text "f_base_tel_taio_tmzone_note"
    t.integer "f_base_movie_enable_flg"
    t.text "f_base_movie_enable_text"
    t.text "f_base_entry_cplt_text"
    t.date "f_base_fax_notice_st_date"
    t.text "f_base_ivr_pwd"
    t.integer "f_base_tel_always_taio_flg"
    t.text "f_job_id"
    t.text "f_job_memo"
    t.text "f_job_title"
    t.text "f_job_title_text"
    t.text "f_job_desc_text"
    t.integer "f_job_trfc_cost_pay_type"
    t.text "f_job_trfc_cost_pay_name"
    t.text "f_job_trfc_cost_pay_note"
    t.text "f_job_holiday_note"
    t.date "f_job_work_st_date"
    t.integer "f_job_work_term_type"
    t.text "f_job_work_term_name"
    t.text "f_job_work_term_note"
    t.text "f_job_exp_text"
    t.text "f_job_plan_saiyo_cnt_text"
    t.text "f_job_fukuri_text"
    t.integer "f_job_movie_no"
    t.text "f_job_movie_filename"
    t.text "f_job_movie_title"
    t.text "f_job_movie_note"
    t.integer "f_job_movie_conv_sts_type"
    t.integer "f_job_kakin_type"
    t.text "f_job_kakin_name"
    t.integer "f_job_rsltkkn_llim_price"
    t.integer "f_job_kakin_price"
    t.integer "f_job_hpybns_price"
    t.text "f_job_hpybns_pay_cond_text"
    t.integer "f_job_richfm_enable_flg"
    t.integer "f_job_pict01_require_flg"
    t.integer "f_job_pict02_require_flg"
    t.text "f_job_disp_base_name"
    t.text "f_job_pr_title"
    t.text "f_job_pr_text"
    t.integer "f_job_kind_type"
    t.text "f_job_kind_name"
    t.string "f_job_place_cd", limit: 5
    t.text "f_job_place_name"
    t.text "f_job_place_shortname"
    t.integer "f_region_type"
    t.text "f_region_type_name"
    t.string "f_tdfk_cd", limit: 2
    t.string "f_city_cd", limit: 3
    t.text "f_tdfk_name"
    t.text "f_city_name"
    t.string "f_sarea_cd", limit: 3
    t.text "f_sarea_name"
    t.string "f_eki1_railroad_cd", limit: 5
    t.string "f_eki1_ensen_cd", limit: 4
    t.string "f_eki1_eki_cd", limit: 3
    t.text "f_eki1_railroad_name"
    t.text "f_eki1_ensen_name"
    t.text "f_eki1_eki_name"
    t.string "f_eki2_railroad_cd", limit: 5
    t.string "f_eki2_ensen_cd", limit: 4
    t.string "f_eki2_eki_cd", limit: 3
    t.text "f_eki2_railroad_name"
    t.text "f_eki2_ensen_name"
    t.text "f_eki2_eki_name"
    t.string "f_eki3_railroad_cd", limit: 5
    t.string "f_eki3_ensen_cd", limit: 4
    t.string "f_eki3_eki_cd", limit: 3
    t.text "f_eki3_railroad_name"
    t.text "f_eki3_ensen_name"
    t.text "f_eki3_eki_name"
    t.string "f_wkplace1_gyo_cd", limit: 5
    t.text "f_wkplace1_gyo_name"
    t.integer "f_wkplace1_brand_cd"
    t.text "f_wkplace1_brand_name"
    t.text "f_wkplace1_name"
    t.text "f_wkplace1_kananame"
    t.string "f_wkplace1_tdfk_cd", limit: 2
    t.string "f_wkplace1_city_cd", limit: 3
    t.text "f_wkplace1_tdfk_name"
    t.text "f_wkplace1_city_name"
    t.string "f_wkplace1_sarea_cd", limit: 3
    t.text "f_wkplace1_sarea_name"
    t.text "f_wkplace1_addr"
    t.integer "f_wkplace1_latitude"
    t.integer "f_wkplace1_longitude"
    t.integer "f_wkplace1_map_disp_flg"
    t.text "f_wkplace1_note"
    t.text "f_wkplace1_memo"
    t.text "f_wkplace1_eki_note"
    t.string "f_wkplace1_eki1_railroad_cd", limit: 5
    t.string "f_wkplace1_eki1_ensen_cd", limit: 4
    t.string "f_wkplace1_eki1_eki_cd", limit: 3
    t.text "f_wkplace1_eki1_railroad_name"
    t.text "f_wkplace1_eki1_ensen_name"
    t.text "f_wkplace1_eki1_eki_name"
    t.integer "f_wkplace1_eki1_trfc_way_type"
    t.text "f_wkplace1_eki1_trfc_way_name"
    t.integer "f_wkplace1_eki1_minutes"
    t.string "f_wkplace1_eki2_railroad_cd", limit: 5
    t.string "f_wkplace1_eki2_ensen_cd", limit: 4
    t.string "f_wkplace1_eki2_eki_cd", limit: 3
    t.text "f_wkplace1_eki2_railroad_name"
    t.text "f_wkplace1_eki2_ensen_name"
    t.text "f_wkplace1_eki2_eki_name"
    t.integer "f_wkplace1_eki2_trfc_way_type"
    t.text "f_wkplace1_eki2_trfc_way_name"
    t.integer "f_wkplace1_eki2_minutes"
    t.string "f_wkplace1_eki3_railroad_cd", limit: 5
    t.string "f_wkplace1_eki3_ensen_cd", limit: 4
    t.string "f_wkplace1_eki3_eki_cd", limit: 3
    t.text "f_wkplace1_eki3_railroad_name"
    t.text "f_wkplace1_eki3_ensen_name"
    t.text "f_wkplace1_eki3_eki_name"
    t.integer "f_wkplace1_eki3_trfc_way_type"
    t.text "f_wkplace1_eki3_trfc_way_name"
    t.integer "f_wkplace1_eki3_minutes"
    t.integer "id"
  end

end
