/*
 * $HEADER$
 */
#if defined(c_plusplus) || defined(__cplusplus)
extern "C" {
#endif

extern const mca_base_component_t mca_if_posix_ipv4_component;
extern const mca_base_component_t mca_if_bsdx_ipv6_component;

const mca_base_component_t *mca_if_base_static_components[] = {
  &mca_if_posix_ipv4_component, 
  &mca_if_bsdx_ipv6_component, 
  NULL
};

#if defined(c_plusplus) || defined(__cplusplus)
}
#endif

