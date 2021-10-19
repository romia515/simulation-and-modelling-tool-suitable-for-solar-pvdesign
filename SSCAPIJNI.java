public class SSCAPIJNI {

    public static native int ssc_version();

    public static native String ssc_build_info();

    public static native int SSC_INVALID_get();

    public static native int SSC_STRING_get();

    public static native int SSC_NUMBER_get();

    public static native int SSC_ARRAY_get();

    public static native int SSC_MATRIX_get();

    public static native int SSC_TABLE_get();

    public static native long ssc_data_create();

    public static native void ssc_data_free(long jarg1);

    public static native void ssc_data_clear(long jarg1);

    public static native void ssc_data_unassign(long jarg1, String jarg2);

    public static native int ssc_data_query(long jarg1, String jarg2);

    public static native String ssc_data_first(long jarg1);

    public static native String ssc_data_next(long jarg1);

    public static native void ssc_data_set_string(long jarg1, String jarg2, String jarg3);

    public static native void ssc_data_set_number(long jarg1, String jarg2, double jarg3);

    public static native void ssc_data_set_array(long cxt, String name, double[] value, int len);

    public static native void ssc_data_set_matrix(long cxt, String name, double[] value, int nrow, int ncol);

    public static native void ssc_data_set_table(long jarg1, String jarg2, long jarg3);

    public static native String ssc_data_get_string(long jarg1, String jarg2);

    public static native int ssc_data_get_number(long cxt, String name, double[] value);

    public static native double[] ssc_data_get_array(long cxt, String name);

    public static native double[] ssc_data_get_matrix(long cxt, String name, int[] len);

    public static native long ssc_data_get_table(long cxt, String name);

    public static native long ssc_module_entry(int jarg1);

    public static native String ssc_entry_name(long jarg1);

    public static native String ssc_entry_description(long jarg1);

    public static native int ssc_entry_version(long jarg1);

    public static native long ssc_module_create(String jarg1);

    public static native void ssc_module_free(long jarg1);

    public static native int SSC_INPUT_get();

    public static native int SSC_OUTPUT_get();

    public static native int SSC_INOUT_get();

    public static native long ssc_module_var_info(long jarg1, int jarg2);

    public static native int ssc_info_var_type(long jarg1);

    public static native int ssc_info_data_type(long jarg1);

    public static native String ssc_info_name(long jarg1);

    public static native String ssc_info_label(long jarg1);

    public static native String ssc_info_units(long jarg1);

    public static native String ssc_info_meta(long jarg1);

    public static native String ssc_info_group(long jarg1);

    public static native String ssc_info_required(long jarg1);

    public static native String ssc_info_constraints(long jarg1);

    public static native String ssc_info_uihint(long jarg1);

    public static native int ssc_module_exec_simple(String jarg1, long jarg2);

    public static native String ssc_module_exec_simple_nothread(String jarg1, long jarg2);

    public static native int SSC_LOG_get();

    public static native int SSC_UPDATE_get();

    public static native int SSC_EXECUTE_get();

    public static native int ssc_module_exec(long cxt_module, long cxt_data);

    public static native int ssc_module_exec_with_handler(long jarg1, long jarg2, long jarg3, long jarg4);

    public static native void ssc_module_exec_set_print(int print);

    public static native void ssc_module_extproc_output(long jarg1, String jarg2);

    public static native int SSC_NOTICE_get();

    public static native int SSC_WARNING_get();

    public static native int SSC_ERROR_get();

    public static native String ssc_module_log(long cxt, int index, int[] type, float[] time);

    public static native void __ssc_segfault();
}
