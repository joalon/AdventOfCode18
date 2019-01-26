#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/fs.h>
#include <linux/slab.h>
#include <linux/miscdevice.h>
#include <linux/uaccess.h>
#include <linux/string.h>

MODULE_LICENSE("GPL");
MODULE_DESCRIPTION("Solution for day 1 of advent of code");
MODULE_AUTHOR("Joakim Lönnegren");

struct miscdevice day1_device;

ssize_t module_write(struct file *f, const char *input, size_t count, loff_t *position) 
{
}

ssize_t module_read(struct file *f, char *user_buffer, size_t count, loff_t *position) 
{
}

static struct file_operations day1_fops = {
	.owner = THIS_MODULE,
	.write = module_write,
	.read = module_read,
};

static int init(void)
{
	int ret;

	day1_device.minor = MISC_DYNAMIC_MINOR;
	day1_device.name = "dev1";
	day1_device.fops = &day1_fops;

	ret = misc_register(&day1_device);
	if (ret)
		return ret;

	pr_debug("day1: init done. Got minor %d\n", day1_device.minor);
	return 0;
}

static void exit(void)
{
	misc_deregister(&day1_device);
	pr_debug("day1: exiting\n");
}

module_init(init);
module_exit(exit);

