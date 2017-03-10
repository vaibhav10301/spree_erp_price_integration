Deface::Override.new(virtual_path: 'spree/admin/shared/_main_menu',
  name: 'add_erp_price_with_spree',
  insert_after: "ul.configurations",
  text: "
      <ul class='nav nav-sidebar erp-integrate'>
       <li class ='sidebar-menu-item'> <%= link_to 'Erp Integrate', admin_erp_price_integrations_path %> <li>
      </ul>
  ")