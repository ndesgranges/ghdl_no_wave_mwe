#include "systemc.h"
#include "adapter.h"

//  Fake VHDL process representing drivers for signals.
void vhdl_driver_process (void *inst)
{
  //cout << "vhdl_driver_process called" << endl;
}


void vhdl_counter_driver_process (void *inst)
{
  mwe_module *entity = static_cast<mwe_module *>(inst);
  entity->counter_adapt ();
}
