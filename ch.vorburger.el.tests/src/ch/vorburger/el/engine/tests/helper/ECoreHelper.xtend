package ch.vorburger.el.engine.tests.helper

import org.eclipse.emf.ecore.EcoreFactory
import org.eclipse.emf.ecore.EClassifier
import org.eclipse.emf.ecore.EClass
import org.eclipse.emf.ecore.EPackage
import org.eclipse.emf.ecore.EObject
import org.eclipse.emf.ecore.EEnum

/** 
 * This class contains helper methods to simplify the way how to interact with dynamic EMF
 */
class ECoreHelper {
	
	def createPackage(String name) {
		val epkg = EcoreFactory::eINSTANCE.createEPackage()
		epkg.name = name
		return epkg
	}
	
	def createClass(EPackage epkg, String name) {
		val eclass = EcoreFactory::eINSTANCE.createEClass()
		eclass.name = name
		epkg.EClassifiers += eclass
		return eclass
	}

	def createEnum(EPackage epkg, String name) {
		val eEnum = EcoreFactory::eINSTANCE.createEEnum()
		eEnum.name = name
		epkg.EClassifiers += eEnum
		return eEnum
	}
	
	def addAttribute(EClass eclass, EClassifier type, String attributeName) {
		val attribute = EcoreFactory::eINSTANCE.createEAttribute()
		attribute.name = attributeName
		attribute.unsettable = false
		attribute.changeable = true
		attribute.EType = type;
		eclass.EStructuralFeatures += attribute
	}

	def addEnumLiteral(EEnum eEnum, String literalName) {
		val literal = EcoreFactory::eINSTANCE.createEEnumLiteral()
		literal.name = literalName
		eEnum.ELiterals += literal
		literal
	}
	
	def createInstance(EClass eclass) {
		eclass.EPackage.EFactoryInstance.create(eclass)
	}
	
	def setProperty(EObject eobj, String name, Object value) {
		eobj.eSet(eobj.eClass.getEStructuralFeature(name), value);
	}
}