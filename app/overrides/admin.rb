Deface::Override.new(:virtual_path  => "spree/layouts/admin",
   replace: "#header code[erb-loud]:contains('[:admin_interface_logo]')",
   text: '<div id="logo"></div>',
   name: 'foundry_admin_logo',
   disabled: false)
