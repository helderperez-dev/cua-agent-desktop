fn main() {
    #[cfg(target_os = "windows")]
    {
        embed_manifest::embed_manifest_file("reavion-driver-uia.manifest")
            .expect("failed to embed reavion-driver-uia.manifest");
        println!("cargo:rerun-if-changed=reavion-driver-uia.manifest");
    }
}
