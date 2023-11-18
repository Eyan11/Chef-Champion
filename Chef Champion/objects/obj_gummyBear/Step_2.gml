// ** Check Health **
if (health <= 0) {
    state = "death";
    instance_destroy();
}
