import * as THREE from 'three';
import { GLTFLoader } from 'GLTFLoader';
import { OrbitControls } from 'OrbitControls';


const container = document.getElementById('webgl-container');

const scene = new THREE.Scene();
scene.background = new THREE.Color(0xdddddd);

const width = 900;
const height = 1260;

const camera = new THREE.PerspectiveCamera(75, width / height, 0.1, 1000);
camera.position.set(5, 5, 5);

const renderer = new THREE.WebGLRenderer({ antialias: true });
renderer.setSize(900, 1260);
container.appendChild(renderer.domElement);

// OrbitControls
const controls = new OrbitControls(camera, renderer.domElement);
controls.enableDamping = true;

// 조명 추가
const color = 0xffffff;
const intensity = 2;
const light = new THREE.DirectionalLight(color, intensity);
light.position.set(-1, 2, 4);
scene.add(light);

const ambientLight = new THREE.AmbientLight(0xffffff, 0.6);
scene.add(ambientLight);


const loader = new GLTFLoader();
loader.load('/models/LowP.glb', function(gltf) {
	const model = gltf.scene;
	scene.add(model);
	model.position.set(0, 0, 0);
}, undefined, function(error) {
	console.error('An error happened:', error);
});


// 반응형
window.addEventListener('resize', () => {
	camera.aspect = window.innerWidth / window.innerHeight;
	camera.updateProjectionMatrix();
	renderer.setSize(window.innerWidth, window.innerHeight);
});

// 애니메이션 루프
function animate() {
	requestAnimationFrame(animate);
	controls.update();
	renderer.render(scene, camera);
}
animate();

loader.load('models/LowP.glb', (gltf) => {
	console.log(gltf.scene);
});


