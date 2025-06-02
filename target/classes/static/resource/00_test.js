import * as THREE from 'three';
import { OrbitControls } from 'three/addons/controls/OrbitControls.js';
import { GLTFLoader } from 'three/addons/loaders/GLTFLoader.js';

const controls = new OrbitControls( camera, renderer.domElement );


const scene = new THREE.Scene();
const camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 1000);
const renderer = new THREE.WebGLRenderer({ antialias: true });
renderer.setSize(window.innerWidth, window.innerHeight);
document.body.appendChild(renderer.domElement);

// 조명
const light = new THREE.DirectionalLight(0xffffff, 1);
light.position.set(1, 1, 1).normalize();
scene.add(light);

// GLB 파일 불러오기
const loader = new GLTFLoader();
loader.load('/model/LowP.glb', (gltf) => {
  scene.add(gltf.scene);
  gltf.scene.position.set(0, 0, 0);
}, undefined, (error) => {
  console.error('Error loading GLB:', error);
});

camera.position.z = 5;

function animate() {
  requestAnimationFrame(animate);
  renderer.render(scene, camera);
}
animate();