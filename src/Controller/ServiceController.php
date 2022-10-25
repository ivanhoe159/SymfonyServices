<?php

namespace App\Controller;

use App\Entity\Service;
use App\Entity\Transactions;
use App\Entity\Usermoney;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;

class ServiceController extends AbstractController {
    public function removeService(ManagerRegistry $doctrine, Request $request, $id)
    {
        $entity = $doctrine->getManager();
        $service = $doctrine->getRepository(service::class)->find($id);
        $service->setActive(0);
        $service->setValue(1);
        $entity->flush();
        $repository = $doctrine->getRepository(service::class);
        $services = $repository->findAll();
        $repository = $doctrine->getRepository(usermoney::class);
        $budget = $repository->findAll();
        return $this->render('service.html.twig', [
            'services' => $services,
            'budget' => $budget,
        ]);
    }

    public function addNewService(ManagerRegistry $doctrine, Request $request)
    {
        $id = $request->request->get('selects');
        $value = $request->request->get('val');
        $entity = $doctrine->getManager();
        $service = $doctrine->getRepository(service::class)->find($id);
        $payment = $service->getCost() * $value;
        $service->setActive(1);
        $service->setValue($value);
        $entity->flush();
        $repository = $doctrine->getRepository(service::class);
        $services = $repository->findAll();
        $repository = $doctrine->getRepository(usermoney::class);
        $budget = $repository->findAll();
        return $this->render('service.html.twig', [
            'services' => $services,
            'budget' => $budget,
        ]);
    }

}